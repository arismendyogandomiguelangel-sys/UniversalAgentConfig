# Aplica UniversalAgentConfig a un proyecto existente (Windows)
param([string]$ProjectDir = (Get-Location).Path)

$repo = "https://raw.githubusercontent.com/angelarismendyroa-lgtm/UniversalAgentConfig/main"

Write-Host "Aplicando UniversalAgentConfig en: $ProjectDir"

New-Item -ItemType Directory -Force -Path "$ProjectDir\.agent\handoffs" | Out-Null

$files = @{
  "CLAUDE.md"                          = "templates/CLAUDE.md"
  "GEMINI.md"                          = "templates/GEMINI.md"
  "AGENTS.md"                          = "AGENTS.md"
  ".agent\context.md"                  = "templates/.agent/context.md"
  ".agent\conventions.md"              = "templates/.agent/conventions.md"
  ".agent\handoffs\current-state.md"   = "templates/.agent/handoffs/current-state.md"
  "mcp_config.json"                    = "templates/mcp_config.json"
}

foreach ($dest in $files.Keys) {
  $src = $files[$dest]
  Invoke-WebRequest -Uri "$repo/$src" -OutFile "$ProjectDir\$dest"
}

Write-Host "Listo. Edita .agent\context.md con la descripcion de tu proyecto."
