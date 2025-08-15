# Modular AI Instructions System for GitHub Copilot

## Usage

```bash
# Clone the repository and set up the AI instructions
git clone https://github.com/gonzalo123/ai-instructions .ai-instructions 

# generate the initial configuration file from the template
cp .ai-instructions/config.ini.dist .ai-instructions/config.ini

# Edit the configuration file to include your desired instruction modules

# Generate the final instructions file
./.ai-instructions/bin/apply.sh
```

## Architecture

```
ai-instructions/
├── config.ini.dist         # Configuration file template (you should copy it to `config.ini`)
├── bin/apply.sh            # Script to generate final instructions
├── common/                 # Reusable instruction modules
│   ├── general.md          # Universal coding principles
│   ├── python.md           # Python-specific guidelines
│   ├── typescript.md       # TypeScript standards
│   ├── php.md              # PHP best practices
│   ├── html_css_js.md      # Frontend development
│   ├── docker.md           # Container guidelines
│   └── large_files.md      # Complex change protocols
└── project/                # Project-specific instructions (excluded in `.gitignore`)
    └── main.md             # Current project customizations (excluded in `.gitignore`)
```

## Configuration System

The `config.ini` file controls which instruction modules are combined:

```ini
[COPILOT]
COPILOT_INSTRUCTION_PATH=".github/copilot-instructions.md"

[CONTEXTS]
common/general.md
common/python.md
common/docker.md
common/typescript.md
project/main.md
```

## Instruction Modules

### Core Modules

#### `common/general.md`
- Universal coding principles (KISS, DRY)
- Security best practices
- Code organization standards
- Documentation requirements

#### `common/python.md`
- Python 3.10+ modern features
- Type hinting and Pydantic usage
- Testing with pytest
- Poetry dependency management
- Async/await patterns

#### `common/typescript.md`
- TypeScript 5.0+ strict configuration
- Advanced type patterns
- Modern ES2022+ features
- Testing with Vitest/Jest
- Error handling strategies

#### `common/php.md`
- PHP 8.1+ modern syntax
- PSR-12 coding standards
- Static analysis with PHPStan
- Constructor property promotion
- Strict typing enforcement

#### `common/html_css_js.md`
- HTML5 semantic elements
- Modern CSS (Grid, Flexbox, Custom Properties)
- ECMAScript 2020+ JavaScript
- Accessibility (WCAG 2.1)
- Performance optimization

#### `common/docker.md`
- Multi-stage builds
- Security best practices
- Performance optimization
- Production-ready configurations

#### `common/large_files.md`
- Complex change protocols
- Mandatory planning phase
- Refactoring guidance
- Progress tracking

### Project-Specific Modules

The `project/` directory contains instructions specific to your current project:

- Custom coding standards
- Project-specific patterns
- Domain-specific requirements
- Team conventions

## Usage

### Basic Usage

1. **Configure your modules** in `config.ini`:
   ```ini
   [CONTEXTS]
   common/general.md
   common/python.md
   common/docker.md
   project/main.md
   ```

2. **Generate instructions**:
   ```bash
   ./bin/apply.sh
   ```

3. **Result**: Combined instructions are written to `.github/copilot-instructions.md`

### Advanced Usage

#### Language-Specific Configurations

For a **Python + Docker** project:
```ini
[CONTEXTS]
common/general.md
common/python.md
common/docker.md
common/large_files.md
project/main.md
```

For a **Full-Stack TypeScript** project:
```ini
[CONTEXTS]
common/general.md
common/typescript.md
common/html_css_js.md
common/docker.md
project/main.md
```

For a **PHP API** project:
```ini
[CONTEXTS]
common/general.md
common/php.md
common/docker.md
project/main.md
```

## How It Works

The `bin/apply.sh` script:

1. **Parses** `config.ini` to extract configuration
2. **Validates** that all referenced modules exist
3. **Concatenates** modules in the specified order
4. **Generates** the final instruction file
5. **Reports** success and any missing files

### Script Features

- **Robust parsing** of INI configuration format
- **Path validation** prevents directory traversal attacks
- **Error handling** for missing files with warnings
- **Cross-platform compatibility** (Linux, macOS)
- **Clean output** with progress indicators

## Benefits

### For Individual Developers
- **Consistency**: Same coding standards across all projects
- **Efficiency**: No need to recreate instructions for each project
- **Quality**: Comprehensive, battle-tested guidelines
- **Flexibility**: Mix and match modules as needed

### For Teams
- **Standardization**: Shared coding practices across team members
- **Onboarding**: New team members get consistent AI assistance
- **Maintenance**: Update standards in one place, apply everywhere
- **Scalability**: Easy to extend with new languages and frameworks

### For Organizations
- **Compliance**: Ensure security and quality standards
- **Knowledge Management**: Codify best practices institutionally
- **Productivity**: Reduce time spent on code reviews
- **Innovation**: Focus on features, not formatting

## Real-World Example

A typical workflow for a new Python microservice:

1. Clone your project template
2. Update `config.ini` for Python + Docker + your domain
3. Run `./bin/apply.sh`
4. Start coding with AI assistance tailored to your stack
5. AI suggestions follow your team's established patterns
