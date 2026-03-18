# UniversalAgentConfig

> Configuración agnóstica al modelo para agentes de código. Aplica a cualquier proyecto y cualquier agente (Claude, Gemini, Qwen, etc.) sabrá inmediatamente dónde está el proyecto, qué se ha hecho, y cómo trabajar con otros agentes.

---

## Aplicar a un proyecto nuevo

**Windows (PowerShell):**
```powershell
irm https://raw.githubusercontent.com/angelarismendyroa-lgtm/UniversalAgentConfig/main/scripts/apply.ps1 | iex
```

**Unix/Mac:**
```bash
curl -fsSL https://raw.githubusercontent.com/angelarismendyroa-lgtm/UniversalAgentConfig/main/scripts/apply.sh | bash
```

**O manualmente:** copia la carpeta `templates/` a la raíz de tu proyecto.

---

## Quick Start

1. Ejecuta el script de apply en tu proyecto
2. Edita `.agent/context.md` con la descripción del proyecto
3. Llena `PROJECT_BRIEF.md` con los detalles del cliente
4. Dile al agente:
   > "Aplica los estándares de UniversalAgentConfig. Lee AGENTS.md y PROJECT_BRIEF.md antes de empezar."

---

## Qué incluye

### Archivos core
- **AGENTS.md** — reglas universales que todo agente lee primero
- **DEFAULT_STACK.md** — configuración predeterminada del stack
- **QUICKSTART.md** — guía rápida

### Skills (instrucciones reutilizables)
| Skill | Propósito |
|-------|-----------|
| `sdd-orchestrator` | Orquestador SDD — coordina todas las fases |
| `sdd-explore` | Explora el codebase |
| `sdd-spec` | Escribe especificaciones |
| `sdd-apply` | Implementa el código |
| `sdd-verify` | Verifica contra specs |
| `sdd-archive` | Guarda a memoria persistente |
| `prisma` | ORM con Supabase |
| `zustand` | Gestión de estado React |
| `security` | Snyk, RLS, vulnerabilidades |
| `api-testing` | Bruno para testing de APIs |
| `stitch` | Stitch Labs (Google design system) |
| `ui-components` | shadcn/ui + Tailwind |
| `ai-fallback` | Manejo de errores de IA |
| `deploy/dokploy-oci` | Deploy a Oracle/GCP/Alibaba |
| `memory-manager` | Engram (memoria persistente) |

### Templates
- `CLAUDE.md` — Config para Claude Code
- `GEMINI.md` — Config para Antigravity/Gemini
- `PROJECT_BRIEF.md` — Brief del proyecto
- `AI_BUDGET.md` — Presupuesto de IA
- `RUNBOOK.md` — Guía de operaciones
- `DELIVERY_CHECKLIST.md` — Checklist de entrega
- `MAINTENANCE_CONTRACT.md` — Contrato de mantenimiento
- `.env.example` — Variables de entorno base
- `.gitignore` — Ignores para proyectos nuevos

### MCP
- Configuración para Engram (memoria persistente)
- Configuración para Context7 (docs en tiempo real)

---

## Ecosistemas

UniversalAgentConfig soporta dos ecosistemas:

### ALiaNeD OS
Solución dentro del framework ALiaNeD (ERP, módulos, Oracle server, Dokploy).
- Incluye los 3 agentes comerciales: Abigail (Recepcionista), José (Supervisor), Daniel (Asesor)
- Stack: Next.js + Stitch Labs + Zustand + n8n + Flowise

### Proyecto Independiente
App/web/sistema desconectado de ALiaNeD.
- Puede estar en cualquier servidor: Oracle, GCP, Alibaba, Vercel, Hostinger
- Puede incluir agentes MayordomIA comerciales opcionales
- Stack: DEFAULT_STACK.md

Ver `ECOSYSTEM_SELECTOR.md` para determinar el ecosistema al inicio del proyecto.

---

## Perfiles

| Componente | Default | Alternativas |
|------------|---------|--------------|
| Base de datos | Supabase | - |
| ORM | Prisma | Drizzle |
| UI | Stitch Labs + Tailwind | shadcn/ui |
| IA incrustada | Qwen API | Claude/Gemini |
| Deploy | Vercel | Dokploy (Oracle/GCP/Alibaba), Hostinger |

Ver `DEFAULT_STACK.md` para detalles completos.

---

## Cómo funciona

1. **Sesión Start:** El agente busca memoria previa con `mem_search()` y lee los archivos de contexto
2. **Trabajo:** Sigue el flujo SDD (Explore → Spec → Apply → Verify → Archive)
3. **Sesión End:** El agente guarda un resumen con `mem_session_summary()` y actualiza `current-state.md`

Todo agente que llega puede continuar donde el anterior dejó sin perder contexto.

---

## Compatible con

- Claude Code
- Antigravity (Gemini)
- Gemini CLI
- Cursor
- OpenCode
- Qwen Coder
- Cualquier agente compatible con MCP

---

*El modelo no importa. El contexto sí.*
