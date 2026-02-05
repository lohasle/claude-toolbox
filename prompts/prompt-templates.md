# Prompt Template Library

一个精心设计的 Prompt 模板库，用于 Claude Code 工作流。

## 使用方法

### 1. 复制模板
直接从下方复制所需模板，粘贴到 Claude Code 对话中。

### 2. 动态替换
模板中的 `{variable}` 会自动替换为实际值。

---

## 模板分类

### 🚀 快速开始

#### 初始上下文加载
```
我需要先了解项目结构，请帮我：
1. 扫描项目目录结构（使用 /browse）
2. 读取关键配置文件（package.json, README.md）
3. 识别技术栈和主要框架
4. 列出3-5个重点需要关注的文件或目录
```

#### 功能开发模板
```
帮我实现 {feature_name}：

需求描述：
{detailed_requirement}

技术要求：
- 框架：{framework}
- 语言：{language}
- 其他依赖：{dependencies}

请按以下步骤：
1. 分析现有代码结构
2. 设计实现方案
3. 编写核心代码
4. 添加单元测试（如果适用）
5. 更新相关文档
```

---

### 🔍 代码审查

#### 全局审查
```
请对整个项目进行代码审查，重点关注：
1. 代码质量和最佳实践
2. 潜在的 bug 或安全漏洞
3. 性能优化机会
4. 代码组织和架构
5. 文档完整性

请提供：
- 总体评估（优秀/良好/需改进）
- 具体问题列表（优先级：高/中/低）
- 改进建议
```

#### 特定文件审查
```
请审查 {file_path}：

审查重点：
- 代码可读性
- 错误处理
- 性能考虑
- 是否符合项目风格指南

期望输出：
- 代码评级（1-10分）
- 发现的问题（如果有）
- 改进建议（如果有）
```

---

### 🐛 Bug 修复

#### Bug 分析模板
```
帮我分析和修复这个 Bug：

Bug 描述：
{bug_description}

复现步骤：
{reproduction_steps}

期望行为：
{expected_behavior}

实际行为：
{actual_behavior}

请帮我：
1. 定位问题根因
2. 分析相关代码
3. 设计修复方案
4. 实现修复代码
5. 添加测试用例防止回归
```

---

### 📚 文档生成

#### API 文档
```
请为我生成 API 文档：

技术栈：
- 框架：{framework}
- 语言：{language}

功能描述：
{functionality_description}

请生成：
1. API 列表（函数签名、参数、返回值）
2. 使用示例（每个 API 至少 1 个示例）
3. 错误处理说明
4. 最佳实践建议
```

---

### ⚡ 性能优化

#### 代码优化请求
```
请帮我优化以下代码的性能：

代码位置：
{code_location}

当前性能：
- 运行时间：{current_runtime}
- 内存占用：{current_memory_usage}

优化目标：
{optimization_goal}

请帮我：
1. 分析性能瓶颈
2. 提出优化方案
3. 实现优化代码
4. 对比优化前后性能
```

---

### 🎨 代码重构

#### 功能重构请求
```
请帮我重构 {function_name}：

当前实现问题：
{current_issues}

重构目标：
- 提高代码可读性
- 提高可维护性
- 提高可测试性

重构原则：
1. 遵循 DRY（Don't Repeat Yourself）
2. 保持单一职责原则
3. 添加适当注释
4. 保持向后兼容（如果需要）
```

---

## 自定义模板

### 创建新模板
```bash
# 使用此格式创建新模板
cp templates/prompt-template.md prompts/my-new-template.md
```

模板格式：
```
# {Template Name}

## 分类
{template_category}

## 描述
{template_description}

## 模板内容
```
{the actual prompt template}
```

## 变量
{list of variables}
```

---

## 最佳实践

1. **明确性**：模板中的需求描述要清晰具体
2. **上下文完整性**：包含所有必要的信息和上下文
3. **可迭代性**：模板应该支持多次使用和逐步完善
4. **分类清晰**：模板应该按功能和用途分类
5. **示例驱动**：提供使用示例来帮助理解
```

---

## 提交新模板

```bash
# 提交新的 Prompt 模板到仓库
git add prompts/my-new-template.md
git commit -m "Add prompt template: {template_name}"
git push origin main
```

---

## 模板统计

当前模板数量：{template_count}
分类数量：{category_count}
总使用次数：{total_usage}

（这些统计应该动态计算和更新）
```

### 使用统计

查看最常用的模板：
```bash
./scripts/template-stats.sh --top 10
```
