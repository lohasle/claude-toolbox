---
name: docker-build
description: Build, manage, and optimize Docker containers for your project
---

# Docker Build Command

Build and manage Docker containers with best practices.

## Usage

```
/docker-build [options]
```

## Options

- `--file, -f`: Dockerfile path (default: Dockerfile)
- `--tag, -t`: Image tag (default: latest)
- `--no-cache`: Build without cache
- `--push`: Push to registry after build
- `--platform`: Target platform (linux/amd64, linux/arm64)

## Examples

### Basic Build
```
/docker-build
```

### With Custom Tag
```
/docker-build --tag myapp:v1.2.0
```

### Multi-platform Build
```
/docker-build --platform linux/amd64,linux/arm64 --tag myapp:v1.0.0
```

## Best Practices

### Multi-stage Build
```dockerfile
# Build stage
FROM python:3.11-slim AS builder
WORKDIR /app
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Production stage
FROM python:3.11-slim
WORKDIR /app
COPY --from=builder /usr/local/lib/python3.11/site-packages /usr/local/lib/python3.11/site-packages
COPY . .
EXPOSE 8000
CMD ["python", "main.py"]
```

### Non-root User
```dockerfile
FROM node:20-alpine
WORKDIR /app
COPY package*.json ./
RUN npm ci --only=production
COPY --chown=node:node . .
USER node
EXPOSE 3000
CMD ["node", "server.js"]
```

## Docker Compose

### Development Setup
```yaml
version: '3.8'
services:
  app:
    build:
      context: .
      dockerfile: Dockerfile.dev
    ports:
      - "3000:3000"
    environment:
      - NODE_ENV=development
    volumes:
      - .:/app
      - node_modules:/app/node_modules
    command: npm run dev

volumes:
  node_modules:
```

### Production Setup
```yaml
version: '3.8'
services:
  app:
    build:
      context: .
      dockerfile: Dockerfile
    ports:
      - "8000:8000"
    environment:
      - NODE_ENV=production
    restart: unless-stopped
```

## Security Scanning

```bash
# Scan image for vulnerabilities
docker scan myapp:latest

# Use trivy for comprehensive scanning
trivy image myapp:latest
```

## Health Checks

```dockerfile
HEALTHCHECK --interval=30s --timeout=10s --start-period=5s --retries=3 \
  CMD python -c "import urllib.request; urllib.request.urlopen('http://localhost:8000/health')" || exit 1
```

## Optimization Tips

1. **Use specific base image tags** instead of `latest`
2. **Combine RUN commands** to reduce layers
3. **Use .dockerignore** to exclude unnecessary files
4. **Copy only necessary files** in each stage
5. **Build with --no-cache** for fresh builds
