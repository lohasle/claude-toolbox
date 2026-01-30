# Skills Guide

A comprehensive guide to creating and using skills in Claude Code.

## What Are Skills?

Skills are reusable workflow definitions that capture best practices, patterns, and domain knowledge. They can be invoked by commands or used by agents during task execution.

## Skill Structure

### Single File Skill
```
skills/
└── my-skill/
    └── SKILL.md
```

### Multi-File Skill
```
skills/
└── complex-skill/
    ├── SKILL.md          # Main skill file
    ├── examples.md        # Usage examples
    ├── patterns.md        # Code patterns
    └── prompts.md         # Example prompts
```

## Creating a Skill

### Frontmatter Format
```yaml
---
name: skill-name
description: Clear, concise description of what this skill teaches
---
```

### Skill Sections

#### 1. When to Use
Describe situations where this skill applies.

```markdown
## When to Use

Use this skill when:
- Working with TypeScript projects
- Implementing REST APIs
- Setting up CI/CD pipelines
```

#### 2. Core Concepts
Explain the fundamental concepts.

```markdown
## Core Concepts

### Concept 1
Brief explanation...

### Concept 2
Brief explanation...
```

#### 3. Best Practices
Provide actionable guidelines.

```markdown
## Best Practices

1. Always validate input data
2. Use environment variables for config
3. Implement proper error handling
```

#### 4. Code Examples
Show concrete examples.

```markdown
## Examples

### Basic Usage
```typescript
// Example code here
```

### Advanced Usage
```typescript
// Advanced example
```
```

#### 5. Common Patterns
Document recurring solutions.

```markdown
## Common Patterns

### Pattern: Repository Pattern
```typescript
// Repository implementation
```

### Pattern: Service Layer
```typescript
// Service implementation
```
```

## Skill Naming Convention

- Use lowercase with hyphens: `python-patterns`, `tdd-workflow`
- Be descriptive: `golang-testing` not just `testing`
- Include technology name: `react-performance` not `performance`

## Including in Commands

Commands can reference skills in their documentation:

```markdown
---
name: my-command
description: Execute my command
---

# My Command

This command uses the [python-patterns](../skills/python-patterns/SKILL.md) skill.

## Usage

/ my-command
```

## Best Practices for Skills

### 1. Keep Focus Narrow
Each skill should cover one specific area.

### 2. Include Real Examples
Use actual code from production projects.

### 3. Explain the "Why"
Don't just show what to do, explain why it's important.

### 4. Add Error Handling
Show how to handle errors gracefully.

### 5. Cross-Reference
Link to related skills and commands.

## Example: Complete Skill File

```markdown
---
name: error-handling
description: Best practices for error handling in Node.js applications
---

# Error Handling Best Practices

## When to Use

Use this skill when:
- Building APIs with Express.js
- Creating CLI tools
- Writing serverless functions

## Core Concepts

### Error Types
- Operational errors (expected failures)
- Programmer errors (bugs)

### Error Propagation
Errors should bubble up with context.

## Best Practices

1. Use custom error classes
2. Include error codes
3. Log with proper levels
4. Don't expose stack traces in production

## Examples

### Custom Error Class
```typescript
class AppError extends Error {
  constructor(message: string, public code: string) {
    super(message);
    this.name = 'AppError';
  }
}
```

### Error Handler Middleware
```typescript
function errorHandler(err: Error, req: Request, res: Response) {
  console.error(err.stack);
  res.status(500).json({
    error: 'Internal Server Error',
    code: 'INTERNAL_ERROR'
  });
}
```

## Common Patterns

### Async Error Wrapper
```typescript
const asyncHandler = (fn: Function) => (req: Request, res: Response) => {
  Promise.resolve(fn(req, res)).catch(next);
};
```

### Result Pattern
```typescript
class Result<T> {
  private constructor(
    private data: T | null,
    private error: Error | null
  ) {}

  static success(data: T): Result<T> {
    return new Result(data, null);
  }

  static failure(error: Error): Result<T> {
    return new Result(null, error);
  }

  isSuccess(): boolean {
    return this.error === null;
  }
}
```

## Related Skills

- [Input Validation](./input-validation/SKILL.md)
- [Logging](./logging/SKILL.md)
```

## Testing Skills

Before submitting a skill:

1. Test with actual Claude Code sessions
2. Verify examples work correctly
3. Check for clarity and completeness
4. Ensure cross-references work

## Directory Structure Summary

```
skills/
├── language-specific/
│   ├── python-patterns/
│   └── golang-patterns/
├── framework-specific/
│   ├── react-patterns/
│   └── springboot-patterns/
├── workflow/
│   ├── tdd-workflow/
│   └── code-review/
├── domain/
│   └── security-review/
└── testing/
    └── verification-loop/
```

## Using Skills in Agents

Agents can reference skills in their instructions:

```markdown
You are a code reviewer.

Reference these skills:
- security-review/ for security checks
- coding-standards/ for code quality
- tdd-workflow/ for testing guidance
```

---

**Tip**: Skills are living documents. Update them as best practices evolve.
