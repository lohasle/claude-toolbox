#!/bin/bash

# Claude Code Formatter
# 自动格式化和优化 Claude Code 配置

set -e

CONFIG_PATH=${1:-"."}

if [ ! -d "$CONFIG_PATH" ]; then
    echo "Error: $CONFIG_PATH is not a directory"
    exit 1
fi

echo "🎨 Formatting Claude Code configs in: $CONFIG_PATH"
echo ""

# 1. 检查 JSON 格式
echo "1️⃣ Checking JSON files..."
JSON_FILES=$(find "$CONFIG_PATH" -name "*.json" -type f)

for file in $JSON_FILES; do
    if command -v jq &> /dev/null; then
        if ! jq empty "$file" &> /dev/null; then
            echo "  ❌ Invalid JSON: $file"
        else
            echo "  ✅ Valid JSON: $file"
        fi
    else
        echo "  ⚠️  jq not installed, skipping JSON validation"
    fi
done

# 2. 格式化 YAML 文件
echo ""
echo "2️⃣ Formatting YAML files..."
YAML_FILES=$(find "$CONFIG_PATH" -name "*.yml" -o -name "*.yaml" -type f)

if command -v yq &> /dev/null; then
    for file in $YAML_FILES; do
        echo "  ✅ Formatted: $file"
        yq eval -i '.' "$file"
    done
else
    echo "  ⚠️ yq not installed, skipping YAML formatting"
fi

# 3. 检查 Markdown 文档
echo ""
echo "3️⃣ Checking Markdown files..."
MD_FILES=$(find "$CONFIG_PATH" -name "*.md" -type f)

for file in $MD_FILES; do
    # Check for markdownlint
    if command -v markdownlint &> /dev/null; then
        if ! markdownlint "$file" &> /dev/null; then
            echo "  ⚠️  Markdown issues: $file"
        fi
    fi
done

# 4. 优化配置结构
echo ""
echo "4️⃣ Optimizing structure..."

# 检查是否有 .claude/ 目录
if [ ! -d "$CONFIG_PATH/.claude" ]; then
    echo "  ⚠️  No .claude/ directory found"
    echo "  💡 Creating .claude/ directory structure..."
    mkdir -p "$CONFIG_PATH/.claude/agents"
    mkdir -p "$CONFIG_PATH/.claude/skills"
    mkdir -p "$CONFIG_PATH/.claude/commands"
    mkdir -p "$CONFIG_PATH/.claude/hooks"
    echo "  ✅ Created .claude structure"
fi

# 5. 生成格式化报告
echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "📊 Formatting Report"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"

JSON_COUNT=$(echo $JSON_FILES | wc -w)
YAML_COUNT=$(echo $YAML_FILES | wc -w)
MD_COUNT=$(echo $MD_FILES | wc -w)

echo "JSON files: $JSON_COUNT"
echo "YAML files: $YAML_COUNT"
echo "Markdown files: $MD_COUNT"
echo ""

TOTAL_FILES=$((JSON_COUNT + YAML_COUNT + MD_COUNT))
echo "Total files checked: $TOTAL_FILES"

echo ""
echo "✨ Formatting complete!"
echo "💡 Tips:"
echo "  - Install 'jq' for better JSON validation"
echo "  - Install 'yq' for YAML formatting"
echo "  - Install 'markdownlint' for Markdown linting"
