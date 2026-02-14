# Claude Toolbox

<p align="center">
  <strong>Claude Code 配置合集中文版 - 专业级 AI 编程助手配置</strong>
</p>

<p align="center">
  <a href="#简介">简介</a> •
  <a href="#特性">特性</a> •
  <a href="#安装">安装</a> •
  <a href="#工具列表">工具列表</a> •
  <a href="#使用指南">使用指南</a> •
  <a href="#常见问题">常见问题</a>
</p>

---

## 简介

Claude Toolbox 是一个经过实战检验的 Claude Code 配置集合，包含生产级的 Agents、Skills、Hooks、Commands 和 MCP 配置。这些配置经过 10+ 个月的日常高强度使用，在多个产品开发中不断优化。

基于 [everything-claude-code](https://github.com/affaan-m/everything-claude-code) 项目，针对中文用户进行了优化。

## 特性

- **跨平台支持** - Windows、macOS、Linux 全平台兼容
- **多包管理器** - 自动检测 npm、pnpm、yarn、bun
- **完整测试覆盖** - 包含单元测试和集成测试
- **CI/CD 集成** - GitHub Actions 自动化测试

---

## 安装

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

## 工具列表

### Agents（代理）

| 代理 | 功能描述 |
|------|----------|
| `planner` | 功能实现规划与任务分解 |
| `architect` | 系统架构设计决策 |
| `code-reviewer` | 代码质量和安全审查 |
| `security-reviewer` | 安全漏洞分析 |
| `tdd-guide` | 测试驱动开发指导 |
| `e2e-runner` | Playwright E2E 测试执行 |
| `build-error-resolver` | 构建错误诊断修复 |
| `refactor-cleaner` | 代码重构和清理 |
| `doc-updater` | 文档同步更新 |
| `go-reviewer` | Go 代码审查 |
| `go-build-resolver` | Go 构建错误修复 |
| `database-reviewer` | 数据库设计审查 |

### Commands（命令）

| 命令 | 功能描述 |
|------|----------|
| `/tdd` | 测试驱动开发流程 |
| `/plan` | 实现规划 |
| `/code-review` | 代码审查 |
| `/build-fix` | 修复构建错误 |
| `/e2e` | E2E 测试生成 |
| `/learn` | 提取会话模式 |
| `/checkpoint` | 保存验证状态 |
| `/verify` | 运行验证循环 |
| `/setup-pm` | 配置包管理器 |
| `/go-review` | Go 代码审查 |
| `/go-test` | Go TDD 工作流 |
| `/go-build` | Go 构建错误修复 |
| `/skill-create` | 从 git 历史生成技能 |
| `/instinct-status` | 查看学习模式状态 |
| `/instinct-import` | 导入学习模式 |
| `/instinct-export` | 导出学习模式 |
| `/evolve` | 聚合模式为技能 |

### Skills（技能）

| 技能 | 功能描述 |
|------|----------|
| `coding-standards` | 编码最佳实践 |
| `backend-patterns` | API、数据库、缓存模式 |
| `frontend-patterns` | React、Next.js 模式 |
| `golang-patterns` | Go 语言惯用法 |
| `golang-testing` | Go 测试模式和基准测试 |
| `python-patterns` | Python 编码模式 |
| `java-coding-standards` | Java 编码规范 |
| `springboot-patterns` | Spring Boot 模式 |
| `springboot-security` | Spring Boot 安全配置 |
| `springboot-tdd` | Spring Boot TDD |
| `postgres-patterns` | PostgreSQL 模式 |
| `continuous-learning` | 自动模式提取 |
| `continuous-learning-v2` | 基于直觉的学习系统 |
| `tdd-workflow` | TDD 方法论 |
| `security-review` | 安全检查清单 |
| `verification-loop` | 持续验证循环 |
| `eval-harness` | 验证评估框架 |

### Rules（规则）

- **security.md** - 安全检查规则
- **coding-style.md** - 编码风格规范
- **testing.md** - 测试覆盖率要求
- **git-workflow.md** - Git 提交规范
- **agents.md** - 代理委托规则
- **performance.md** - 性能优化规则

### Hooks（钩子）

- **memory-persistence** - 会话记忆持久化
- **strategic-compact** - 策略性压缩建议
- **session-start** - 会话启动初始化
- **session-end** - 会话结束保存

---

## 使用指南

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

### 上下文窗口管理

- 保持 20-30 个 MCP 配置
- 每个项目启用不超过 10 个
- 活跃工具保持在 80 个以下

### 包管理器配置

```bash
# 通过环境变量
export CLAUDE_PACKAGE_MANAGER=pnpm

# 通过命令
/setup-pm
```

---

## 常见问题

### Q: 如何选择合适的 Agent？

根据任务类型选择：
- **新功能开发** → `planner` + `tdd-guide`
- **代码审查** → `code-reviewer` + `security-reviewer`
- **架构设计** → `architect`
- **测试编写** → `tdd-guide` + `e2e-runner`
- **Go 项目** → `go-reviewer` + `go-build-resolver`

### Q: 如何配置规则？

```bash
# 用户级规则（所有项目生效）
cp rules/* ~/.claude/rules/

# 项目级规则（仅当前项目）
mkdir -p .claude/rules
cp rules/* .claude/rules/
```

### Q: 如何添加自定义技能？

1. 创建 `skills/my-skill/SKILL.md`
2. 描述技能的工作流程
3. 添加示例和使用场景

### Q: CI 测试失败怎么办？

1. 检查 Node.js 版本（需要 18+）
2. 运行 `node tests/run-all.js` 查看详情
3. 检查 markdown 格式是否正确

### Q: 如何更新插件？

```bash
/plugin update claude-toolbox@claude-toolbox
```

---

## 测试

```bash
# 运行所有测试
node tests/run-all.js

# 运行单独测试
node tests/lib/utils.test.js
node tests/lib/package-manager.test.js
node tests/hooks/hooks.test.js
```

---

## 贡献

欢迎提交 Issue 和 Pull Request！

贡献方向：
- 语言特定技能（Python、Rust 等）
- 框架配置（Django、Rails、Laravel）
- DevOps 代理（Kubernetes、Terraform）
- 测试策略

详见 [CONTRIBUTING.md](CONTRIBUTING.md)

---

## 许可证

MIT License

---

## 相关链接

- [GitHub 仓库](https://github.com/lohasle/claude-toolbox)
- [原项目](https://github.com/affaan-m/everything-claude-code)
- [问题反馈](https://github.com/lohasle/claude-toolbox/issues)

---

*基于 everything-claude-code 持续优化 - 2026-02*
