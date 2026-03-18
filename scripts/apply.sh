#!/usr/bin/env bash
# Aplica UniversalAgentConfig a un proyecto existente
set -euo pipefail

REPO="https://raw.githubusercontent.com/angelarismendyroa-lgtm/UniversalAgentConfig/main"
PROJECT_DIR="${1:-$(pwd)}"

echo "Aplicando UniversalAgentConfig en: $PROJECT_DIR"

# Crear estructura .agent/
mkdir -p "$PROJECT_DIR/.agent/handoffs"

# Descargar templates
curl -fsSL "$REPO/templates/CLAUDE.md"    -o "$PROJECT_DIR/CLAUDE.md"
curl -fsSL "$REPO/templates/GEMINI.md"    -o "$PROJECT_DIR/GEMINI.md"
curl -fsSL "$REPO/AGENTS.md"              -o "$PROJECT_DIR/AGENTS.md"
curl -fsSL "$REPO/templates/.agent/context.md"     -o "$PROJECT_DIR/.agent/context.md"
curl -fsSL "$REPO/templates/.agent/conventions.md" -o "$PROJECT_DIR/.agent/conventions.md"
curl -fsSL "$REPO/templates/.agent/handoffs/current-state.md" -o "$PROJECT_DIR/.agent/handoffs/current-state.md"
curl -fsSL "$REPO/templates/mcp_config.json" -o "$PROJECT_DIR/mcp_config.json"

echo "Listo. Ahora edita .agent/context.md con la descripción de tu proyecto."
