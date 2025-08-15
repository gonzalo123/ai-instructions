#!/bin/bash

# --- Initial setup and validation ---
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CONFIG_FILE="$SCRIPT_DIR/../config.ini"

# Check if the configuration file exists.
if [[ ! -f "$CONFIG_FILE" ]]; then
    echo "Error: Configuration file not found at '$CONFIG_FILE'." >&2
    exit 1
fi

# --- 1. Read and parse the config file ---
COPILOT_INSTRUCTION_PATH=""
CONTEXT_FILES=""
section=""

while IFS= read -r line || [ -n "$line" ]; do
    line="${line#"${line%%[![:space:]]*}"}" # Trim leading whitespace
    line="${line%"${line##*[![:space:]]}"}" # Trim trailing whitespace

    [[ -z "$line" || "$line" =~ ^# ]] && continue

    if [[ "$line" =~ ^\[(.*)\]$ ]]; then
        section="${BASH_REMATCH[1]}"
    elif [[ -n "$section" ]]; then
        case "$section" in
            COPILOT)
                if [[ "$line" =~ ^[[:space:]]*COPILOT_INSTRUCTION_PATH[[:space:]]*=[[:space:]]*(.*)$ ]]; then
                    COPILOT_INSTRUCTION_PATH="${BASH_REMATCH[1]}"
                    COPILOT_INSTRUCTION_PATH="${COPILOT_INSTRUCTION_PATH%\"}"
                    COPILOT_INSTRUCTION_PATH="${COPILOT_INSTRUCTION_PATH#\"}"
                fi
                ;;
            CONTEXTS)
                CONTEXT_FILES+="$line"$'\n'
                ;;
        esac
    fi
done < "$CONFIG_FILE"

# --- 2. Validate required variables ---
if [[ -z "$COPILOT_INSTRUCTION_PATH" ]]; then
    echo "Error: 'COPILOT_INSTRUCTION_PATH' key not found in the [COPILOT] section." >&2
    exit 1
fi

# --- 3. Securely handle and generate the output file path ---
OUTPUT_DIR_BASE="$SCRIPT_DIR/.."
UNSAFE_OUTPUT_PATH="$OUTPUT_DIR_BASE/$COPILOT_INSTRUCTION_PATH"

# Check for realpath with the '-m' option.
if command -v realpath &>/dev/null && realpath -m /dev/null &>/dev/null; then
    OUTPUT_FILE=$(realpath -m "$UNSAFE_OUTPUT_PATH")
else
    # Fallback for systems without realpath or without the '-m' option.
    echo "Warning: `realpath -m` is not supported. Using a less robust path resolution." >&2
    OUTPUT_FILE=$(cd "$(dirname "$UNSAFE_OUTPUT_PATH")" && pwd)/$(basename "$UNSAFE_OUTPUT_PATH")
fi

mkdir -p "$(dirname "$OUTPUT_FILE")"
true > "$OUTPUT_FILE"
echo "Generating '$OUTPUT_FILE'..."

# --- 4. Loop and concatenate files ---
while IFS= read -r file; do
    file="${file#"${file%%[![:space:]]*}"}" # Trim leading whitespace
    [[ -z "$file" ]] && continue

    CONTEXT_FILE_PATH="$SCRIPT_DIR/../$file"

    if [[ -f "$CONTEXT_FILE_PATH" ]]; then
        # Add a newline separator between files, but not at the very beginning.
        if [[ -s "$OUTPUT_FILE" ]]; then
            echo >> "$OUTPUT_FILE"
        fi

        cat "$CONTEXT_FILE_PATH" >> "$OUTPUT_FILE"
        echo "✅ '$file' included."
    else
        echo "⚠️ Warning: The file '$CONTEXT_FILE_PATH' was not found. Skipping." >&2
    fi
done <<< "$CONTEXT_FILES"

echo "Process completed. '$OUTPUT_FILE' has been updated."