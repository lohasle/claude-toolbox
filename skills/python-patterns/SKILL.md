---
name: python-patterns
description: Python best practices, patterns, and conventions for clean, maintainable code.
---

# Python Patterns & Best Practices

Python coding standards and patterns for production applications.

## Code Style Principles

### PEP 8 Compliance
- Use 4 spaces for indentation (no tabs)
- Maximum line length: 100 characters
- Use descriptive variable and function names
- Follow PEP 8 style guide

### Naming Conventions
```python
# Variables: snake_case
user_name = "john"
total_count = 42

# Functions: snake_case
def calculate_total_price():
    pass

# Classes: PascalCase
class UserRepository:
    pass

# Constants: UPPER_SNAKE_CASE
MAX_RETRY_COUNT = 3
DEFAULT_TIMEOUT = 30
```

## Type Hints

### Basic Type Hints
```python
def greet(name: str) -> str:
    return f"Hello, {name}!"

def calculate_sum(numbers: list[float]) -> float:
    return sum(numbers)

def process_items(items: list[str], threshold: int) -> dict[str, list[str]]:
    return {"large": [i for i in items if len(i) > threshold]}
```

### Advanced Type Hints
```python
from typing import Union, Optional, List, Dict, Any

def fetch_data(url: str, timeout: int = 30) -> Optional[Dict[str, Any]]:
    """Fetch data from URL with optional timeout."""
    pass

UserId = Union[int, str]

def get_user(user_id: UserId) -> Optional[Dict[str, Any]]:
    pass
```

## Error Handling

### Proper Exception Handling
```python
def read_config_file(file_path: str) -> dict:
    """Read and parse configuration file."""
    try:
        with open(file_path, 'r') as f:
            return json.load(f)
    except FileNotFoundError:
        logger.error(f"Config file not found: {file_path}")
        raise ConfigurationError(f"Missing config: {file_path}")
    except json.JSONDecodeError as e:
        logger.error(f"Invalid JSON in {file_path}: {e}")
        raise ConfigurationError(f"Invalid JSON format")
    except PermissionError:
        logger.error(f"Permission denied: {file_path}")
        raise
```

### Custom Exceptions
```python
class AppError(Exception):
    """Base exception for application errors."""
    def __init__(self, message: str, code: str = "APP_ERROR"):
        self.message = message
        self.code = code
        super().__init__(message)

class ValidationError(AppError):
    """Raised when input validation fails."""
    pass

class DatabaseError(AppError):
    """Raised when database operations fail."""
    pass
```

## Async/Await Patterns

### Async Functions
```python
import asyncio
from typing import AsyncGenerator

async def fetch_all(urls: list[str]) -> list[dict]:
    """Fetch multiple URLs concurrently."""
    async with aiohttp.ClientSession() as session:
        tasks = [fetch_url(session, url) for url in urls]
        return await asyncio.gather(*tasks)

async def stream_data() -> AsyncGenerator[dict, None]:
    """Stream data from source."""
    async for item in data_source:
        yield process_item(item)
```

## Class Design

### Data Classes
```python
from dataclasses import dataclass
from datetime import datetime

@dataclass
class User:
    id: int
    username: str
    email: str
    created_at: datetime
    is_active: bool = True

    def to_dict(self) -> dict:
        return {
            "id": self.id,
            "username": self.username,
            "email": self.email,
            "created_at": self.created_at.isoformat(),
            "is_active": self.is_active
        }
```

### Properties with Validation
```python
class BankAccount:
    def __init__(self, initial_balance: float):
        self._balance = initial_balance

    @property
    def balance(self) -> float:
        return self._balance

    @balance.setter
    def balance(self, value: float):
        if value < 0:
            raise ValueError("Balance cannot be negative")
        self._balance = value

    def deposit(self, amount: float) -> None:
        if amount <= 0:
            raise ValueError("Deposit amount must be positive")
        self._balance += amount
```

## Testing Patterns

### Pytest Fixtures
```python
import pytest
from typing import Generator

@pytest.fixture
def mock_user() -> dict:
    return {
        "id": 1,
        "username": "testuser",
        "email": "test@example.com"
    }

@pytest.fixture
def app_client(mock_user) -> Generator[TestClient, None, None]:
    with TestClient(app) as client:
        yield client

def test_create_user(app_client, mock_user):
    response = app_client.post("/users", json=mock_user)
    assert response.status_code == 201
    assert response.json()["username"] == "testuser"
```

### Parametrized Tests
```python
@pytest.mark.parametrize("input,expected", [
    ("3+5", 8),
    ("2+2", 4),
    ("10-5", 5),
])
def test_calculate(input: str, expected: int):
    result = eval(input)
    assert result == expected
```

## Project Structure

```
src/
├── __init__.py
├── main.py           # Application entry point
├── config.py         # Configuration management
├── models/           # Data models
│   ├── __init__.py
│   └── user.py
├── services/         # Business logic
│   ├── __init__.py
│   └── user_service.py
├── repositories/     # Data access
│   ├── __init__.py
│   └── user_repository.py
├── api/              # API endpoints
│   ├── __init__.py
│   └── routes.py
└── utils/            # Utilities
    ├── __init__.py
    └── helpers.py
```

## Virtual Environment

```bash
# Create virtual environment
python -m venv venv

# Activate
source venv/bin/activate  # Linux/macOS
venv\Scripts\activate     # Windows

# Install dependencies
pip install -r requirements.txt

# Generate requirements.txt
pip freeze > requirements.txt
```

## Performance Tips

### Use Built-in Methods
```python
# Instead of:
result = []
for x in items:
    if x > 0:
        result.append(x * 2)

# Use:
result = [x * 2 for x in items if x > 0]

# Or for sums:
total = sum(item.price for item in items)
```

### Generator for Large Data
```python
def read_large_file(file_path: str):
    """Memory-efficient file reading."""
    with open(file_path, 'r') as f:
        for line in f:
            yield process_line(line)

# Usage
for record in read_large_file("data.txt"):
    process_record(record)
```

## Security Best Practices

### Input Validation
```python
import re
from pydantic import BaseModel, validator

class UserCreate(BaseModel):
    email: str
    password: str
    username: str

    @validator('email')
    def validate_email(cls, v):
        if not re.match(r'^[\w\.-]+@[\w\.-]+\.\w+$', v):
            raise ValueError('Invalid email format')
        return v

    @validator('password')
    def validate_password(cls, v):
        if len(v) < 8:
            raise ValueError('Password must be at least 8 characters')
        return v
```

**Remember**: Python's philosophy emphasizes readability. Write code that is clear, maintainable, and follows established conventions.
