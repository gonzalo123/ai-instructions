## Python Requirements

- **Target Version**: Python 3.10 or higher
- **Language**: All comments, docstrings, and variable names MUST be in English
- **Code Style**:
  - Follow **PEP8** with automated linting using **flake8** or **ruff**
  - Use type hints throughout (`def func(a: int) -> str`)
  - Use **black** for code formatting
  - Prefer **isort** for import ordering
  - Enforce docstrings in Google or NumPy style with **pydocstyle**
  - All comments and docstrings should be in English

- **Features to Use**:
  - Pattern matching (`match-case`)
  - Type hinting with `|` union syntax
  - Context managers (`with` statement), including custom ones
  - F-strings for formatting
  - Walrus operator (`:=`) when appropriate
  - Dictionary and set comprehensions
  - Built-in functional tools (`map`, `filter`, `zip`, `enumerate`)
  - Generators and `yield from`
  - Async/await for concurrency, use **asyncio**
  - Use `pathlib.Path` over `os.path`
  - Prefer `collections.defaultdict`, `Counter`, `deque`, etc. when applicable
  - Use `typing` constructs: `Literal`, `TypedDict`, `Final`, `Protocol`, `Annotated`
  - Prefer pydantic instead of dataclasses for data validation and settings management

- **Testing**:
  - Use **pytest** for all test cases
  - Include fixtures for setup/teardown
  - Prefer parametrized tests for repetitive cases
  - Maintain >90% test coverage
  - Mock external calls with **unittest.mock**
  - Coverage checks enforced via **coverage.py**

- **Error Handling**:
  - Raise specific exceptions, avoid generic `Exception`
  - Use custom exception classes where needed
  - Never suppress exceptions without logging
  - Log exceptions with **logging** module
  - Ensure all user input is validated and sanitized
  - **All exception messages and log entries in English**

- **Dependency Management**:
  - Use **Poetry** not `pip` for dependency management
  - Always pin exact versions in `requirements.txt` or `pyproject.toml`
  - Separate runtime and dev dependencies

- **Security**:
  - Avoid use of `eval` and `exec`
  - Never hardcode secrets; use environment variables
  - Use `secrets` module for cryptographic tokens
  - Validate and sanitize all inputs
  - Use `pydantic` or `attrs` for structured validation

- **Documentation**:
  - Only comment non-trivial or tricky logic.
  - Use English language for all comments and logging messages.

- **Code Organization**:
  - Structure code in modules with single-responsibility
  - Group related logic into packages
  - Use `__init__.py` for explicit package initialization
  - Avoid circular imports; resolve with dependency inversion or restructuring
