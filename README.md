# UniversalAgentConfig

Aplica este repositorio a cualquier proyecto para que cualquier agente de código
(Claude, Gemini, Qwen, u otro) pueda continuar donde el anterior dejó.

## Aplicar a un proyecto nuevo

**Unix/Mac:**
```bash
curl -fsSL https://raw.githubusercontent.com/angelarismendyroa-lgtm/UniversalAgentConfig/main/scripts/apply.sh | bash
```

**Windows (PowerShell):**
```powershell
irm https://raw.githubusercontent.com/angelarismendyroa-lgtm/UniversalAgentConfig/main/scripts/apply.ps1 | iex
```

**O manualmente:** copia la carpeta `templates/` a la raíz de tu proyecto.

## Qué incluye
- `AGENTS.md` — reglas universales que todo agente lee primero
- `skills/` — instrucciones reutilizables para cada fase del desarrollo
- `mcp/` — configuración de Engram (memoria persistente) para Claude y Antigravity
- `templates/` — archivos listos para copiar a proyectos nuevos

## Cómo usarlo después

En cualquier proyecto nuevo, dile al agente:
> "Aplica los estándares de UniversalAgentConfig.
>  Lee AGENTS.md y .agent/context.md antes de empezar."

Eso es todo.
