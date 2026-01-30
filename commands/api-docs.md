---
name: api-docs
description: Generate API documentation from code comments and OpenAPI specs
---

# API Documentation Generator

Generate comprehensive API documentation automatically.

## Usage

```
/api-docs [options]
```

## Options

- `--format, -f`: Output format (markdown, openapi, html)
- `--output, -o`: Output file path
- `--include-private`: Include private endpoints
- `--title`: Documentation title

## Examples

### Generate Markdown Docs
```
/api-docs --format markdown --output API.md
```

### Generate OpenAPI Spec
```
/api-docs --format openapi --output openapi.json
```

### Generate HTML Docs
```
/api-docs --format html --output docs/index.html
```

## Comment Format

### Endpoint Documentation
```python
"""
GET /api/users

Retrieve a list of all users.

Query Parameters:
    - page (int): Page number (default: 1)
    - limit (int): Items per page (default: 20, max: 100)
    - sort (str): Sort field (name, created_at)
    - order (str): Sort order (asc, desc)

Returns:
    {
        "success": true,
        "data": [...],
        "meta": {
            "total": 100,
            "page": 1,
            "limit": 20
        }
    }

Raises:
    - 400: Invalid parameters
    - 401: Unauthorized
    - 500: Internal server error
"""

@app.get("/api/users")
async def get_users(
    page: int = Query(1, ge=1),
    limit: int = Query(20, ge=1, le=100),
    sort: str = Query("name"),
    order: str = Query("asc")
):
    pass
```

### Request/Response Models
```python
"""
POST /api/users

Create a new user.

Request Body (UserCreate):
    - name (str): User's full name (1-100 chars)
    - email (str): Valid email address
    - password (str): Min 8 chars, must include letter and number

Response (201 Created):
    {
        "success": true,
        "data": {
            "id": 1,
            "name": "John Doe",
            "email": "john@example.com",
            "created_at": "2024-01-15T10:30:00Z"
        }
    }
"""

class UserCreate(BaseModel):
    name: str = Field(..., min_length=1, max_length=100)
    email: EmailStr
    password: str = Field(..., min_length=8)
```

## Output Examples

### Markdown Output
```markdown
# API Documentation

## Users

### GET /api/users
Retrieve a list of all users.

**Query Parameters:**
| Parameter | Type | Required | Default | Description |
|-----------|------|----------|---------|-------------|
| page | int | No | 1 | Page number |
| limit | int | No | 20 | Items per page |

**Response:**
```json
{
  "success": true,
  "data": [...],
  "meta": {...}
}
```
```

### OpenAPI Output
```json
{
  "openapi": "3.0.0",
  "info": {
    "title": "API Documentation",
    "version": "1.0.0"
  },
  "paths": {
    "/api/users": {
      "get": {
        "summary": "Retrieve users",
        "parameters": [...],
        "responses": {...}
      }
    }
  }
}
```

## Integration with FastAPI

FastAPI automatically generates OpenAPI docs at `/openapi.json`. This command enhances it with:

1. Better descriptions from docstrings
2. Request/response examples
3. Multiple examples per parameter
4. Tags and grouping

## Best Practices

1. **Document all endpoints** including error responses
2. **Use consistent naming** for paths and parameters
3. **Include examples** for complex payloads
4. **Version your API** in the path (`/api/v1/...`)
5. **Link related endpoints** in descriptions
