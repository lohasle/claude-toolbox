# 贡献指南

感谢您考虑为 Claude Toolbox 做出贡献！

## 快速开始

### 1. Fork 并克隆

```bash
git clone https://github.com/<your-username>/claude-toolbox.git
cd claude-toolbox
```

### 2. 安装依赖

```bash
npm install
```

### 3. 创建分支

```bash
git checkout -b feature/AmazingFeature
```

### 4. 运行测试

```bash
node tests/run-all.js
```

## 贡献类型

### 添加新 Agent

在 `agents/` 目录创建 `.md` 文件：

```markdown
---
name: your-agent
description: 简短描述
tools: ["Read", "Grep", "Glob", "Bash"]
model: sonnet
---

你是一个专业的...
```

### 添加新 Skill

在 `skills/` 目录创建文件夹：

```
skills/your-skill/
├── SKILL.md          # 技能定义
└── examples/         # 可选示例
```

### 添加新 Command

在 `commands/` 目录创建 `.md` 文件：

```markdown
---
name: your-command
description: 命令描述
---

# 命令说明

执行步骤...
```

### 添加新 Rule

在 `rules/` 目录创建 `.md` 文件：

```markdown
# 规则名称

- 规则条目 1
- 规则条目 2
```

## 代码规范

### Markdown 格式

- 使用标准 Markdown 语法
- 标题层级正确（H1 -> H2 -> H3）
- 代码块指定语言

### 提交规范

使用约定式提交：

```
feat: 添加新的 Python 代码审查 agent
fix: 修复 hooks 配置问题
docs: 更新安装文档
chore: 更新 CI 配置
```

### PR 规范

1. 描述清楚改动内容
2. 关联相关 Issue
3. 确保测试通过
4. 更新相关文档

## 测试

```bash
# 运行所有测试
node tests/run-all.js

# 运行单个测试
node tests/lib/utils.test.js
node tests/lib/package-manager.test.js
node tests/hooks/hooks.test.js
```

## 验证脚本

```bash
# 验证 agents
node scripts/ci/validate-agents.js

# 验证 hooks
node scripts/ci/validate-hooks.js

# 验证 commands
node scripts/ci/validate-commands.js

# 验证 skills
node scripts/ci/validate-skills.js

# 验证 rules
node scripts/ci/validate-rules.js
```

## 贡献方向

欢迎贡献以下内容：

- 语言特定技能（Python, Rust, Java, Go 等）
- 框架配置（Django, Rails, Laravel, Spring 等）
- DevOps 代理（Kubernetes, Terraform, AWS 等）
- 测试策略（不同测试框架）
- 领域知识（ML, 数据工程, 移动开发等）

## 许可证

贡献的代码将采用 MIT 许可证。

---

*感谢您的贡献！*
