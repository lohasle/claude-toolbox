#!/bin/bash
echo "🚀 Claude Toolbox 安装脚本"
TARGET_DIR="${CLAUDE_DIR:-$HOME/.claude}"
mkdir -p "$TARGET_DIR"/{agents,skills,commands,mcp-configs}
cp -r agents/* "$TARGET_DIR/agents/" 2>/dev/null || true
cp -r skills/* "$TARGET_DIR/skills/" 2>/dev/null || true
cp -r commands/* "$TARGET_DIR/commands/" 2>/dev/null || true
cp -r mcp-configs/* "$TARGET_DIR/mcp-configs/" 2>/dev/null || true
echo "✅ 安装完成！重启Claude Code加载配置"
