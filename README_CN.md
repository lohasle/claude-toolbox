# Claude Toolbox

<p align="center">
  <strong>Claude Code 配置合集中文版 - 专业级 AI 编程助手配置</strong>
</p>

<p align="center">
  <a href="#简介">简介</a> •
  <a href="#特性">特性</a> •
  <a href="#安装">安装</a> •
  <a href="#组件">组件</a> •
  <a href="#使用指南">使用指南</a>
</p>

---

## 📖 简介

Claude Toolbox 是一个经过实战检验的 Claude Code 配置集合，包含生产级的 Agents、Skills、Hooks、Commands 和 MCP 配置。这些配置经过 10+ 个月的日常高强度使用，在多个产品开发中不断优化。

基于 [everything-claude-code](https://github.com/affaan-m/everything-claude-code) 项目，针对中文用户进行了优化。

## ✨ 特性

### 🤖 智能代理 (Agents)
- **planner** - 功能实现规划
- **architect** - 系统设计决策
- **code-reviewer** - 代码质量和安全审查
- **tdd-guide** - 测试驱动开发指导
- **security-reviewer** - 漏洞分析
- **e2e-runner** - Playwright E2E 测试

### 📚 技能库 (Skills)
- **coding-standards** - 编码最佳实践
- **backend-patterns** - API、数据库、缓存模式
- **frontend-patterns** - React、Next.js 模式
- **continuous-learning** - 自动从会话中提取模式
- **tdd-workflow** - TDD 方法论
- **security-review** - 安全检查清单

### ⚡ 命令 (Commands)
| 命令 | 功能 |
|------|------|
| `/tdd` | 测试驱动开发 |
| `/plan` | 实现规划 |
| `/code-review` | 代码审查 |
| `/build-fix` | 修复构建错误 |
| `/e2e` | E2E 测试生成 |
| `/learn` | 提取模式 |
| `/checkpoint` | 保存验证状态 |

### 🪝 钩子 (Hooks)
- 会话生命周期管理
- 记忆持久化
- 策略压缩建议

### 🔌 MCP 配置
预配置的服务器：
- GitHub
- Supabase
- Vercel
- Railway

---

## 🚀 安装

### 方式一：作为插件安装（推荐）

```bash
# 添加市场
/plugin marketplace add lohasle/claude-toolbox

# 安装插件
/plugin install claude-toolbox@claude-toolbox
```

### 方式二：手动安装

```bash
# 克隆仓库
git clone https://github.com/lohasle/claude-toolbox.git

# 复制配置到 Claude 配置目录
cp -r claude-toolbox/agents/*.md ~/.claude/agents/
cp -r claude-toolbox/rules/*.md ~/.claude/rules/
cp -r claude-toolbox/commands/*.md ~/.claude/commands/
cp -r claude-toolbox/skills/* ~/.claude/skills/
```

---

## 📦 组件说明

```
claude-toolbox/
├── agents/           # 专业代理配置
│   ├── planner.md        # 实现规划
│   ├── architect.md      # 架构设计
│   └── code-reviewer.md  # 代码审查
├── skills/           # 工作流定义
│   ├── coding-standards/ # 编码规范
│   ├── backend-patterns/ # 后端模式
│   └── frontend-patterns/# 前端模式
├── commands/         # 快捷命令
│   ├── tdd.md           # TDD 命令
│   ├── plan.md          # 规划命令
│   └── code-review.md   # 审查命令
├── hooks/            # 自动化钩子
│   └── hooks.json       # 钩子配置
├── rules/            # 强制规则
│   ├── security.md      # 安全规则
│   └── coding-style.md  # 编码风格
└── mcp-configs/      # MCP 服务器配置
    └── mcp-servers.json # 服务器列表
```

---

## 📖 使用指南

### 快速开始

1. **规划功能**
```bash
/plan 实现用户登录功能
```

2. **TDD 开发**
```bash
/tdd 编写用户认证测试
```

3. **代码审查**
```bash
/code-review
```

### 最佳实践

#### 上下文窗口管理
- 保持 20-30 个 MCP 配置
- 每个项目启用不超过 10 个
- 活跃工具保持在 80 个以下

#### 规则配置
```bash
# 用户级规则（所有项目生效）
cp rules/* ~/.claude/rules/

# 项目级规则（仅当前项目）
mkdir -p .claude/rules
cp rules/* .claude/rules/
```

---

## 🔧 配置示例

### 项目配置 (.claude/CLAUDE.md)

```markdown
# 项目规则

## 技术栈
- React 18 + TypeScript
- Node.js + Express
- PostgreSQL

## 编码规范
- 使用函数式组件
- 优先使用 hooks
- 测试覆盖率 > 80%
```

### 用户配置 (~/.claude.json)

```json
{
  "extraKnownMarketplaces": {
    "claude-toolbox": {
      "source": {
        "source": "github",
        "repo": "lohasle/claude-toolbox"
      }
    }
  }
}
```

---

## 🧪 测试

```bash
# 运行所有测试
node tests/run-all.js

# 运行单独测试
node tests/lib/utils.test.js
node tests/hooks/hooks.test.js
```

---

## 🤝 贡献

欢迎提交 Issue 和 Pull Request！

贡献方向：
- 语言特定技能（Python、Rust 等）
- 框架配置（Django、Rails、Laravel）
- DevOps 代理（Kubernetes、Terraform）
- 测试策略

---

## 📄 许可证

MIT License

---

## 🔗 相关链接

- [GitHub 仓库](https://github.com/lohasle/claude-toolbox)
- [原项目](https://github.com/affaan-m/everything-claude-code)
- [问题反馈](https://github.com/lohasle/claude-toolbox/issues)

---

*基于 everything-claude-code 持续优化 - 2026-02*
