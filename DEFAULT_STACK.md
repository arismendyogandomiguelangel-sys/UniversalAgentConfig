# DEFAULT_STACK.md — Configuración de Desarrollo Predeterminada

> Cuando el usuario diga "crea este proyecto según la configuración predeterminada",
> usa exactamente este stack sin preguntar — salvo las excepciones indicadas.

---

## Stack Predeterminado Completo

### Base de datos
- **Supabase** (PostgreSQL)
- Row Level Security activado por defecto
- Supabase Auth para autenticación
- Variables: `NEXT_PUBLIC_SUPABASE_URL`, `NEXT_PUBLIC_SUPABASE_ANON_KEY`, `SUPABASE_SERVICE_ROLE_KEY`

### Diseño / UI
- **Stitch Labs** (Google)
- Skills disponibles en `skills/stitch/`
- Complementar con Tailwind si Stitch no cubre el componente

### ORM
- **Prisma** como predeterminado
- **Drizzle** como alternativa (preguntar si el usuario lo prefiere para el proyecto)
- Migraciones siempre versionadas en git

### Gestión de repositorio
- **GitHub** (siempre)
- Branch principal: `main`
- Branch de desarrollo: `dev` o `feature/[nombre]`
- PRs obligatorios para merge a `main` — nunca push directo

### API de IA (agentes incrustados en el proyecto)
- **Qwen** como modelo predeterminado para agentes dentro del proyecto
- Usar vía API: `https://dashscope.aliyuncs.com` o compatible OpenAI
- Variable: `QWEN_API_KEY`
- Solo cambiar a Claude/Gemini API si el cliente lo requiere explícitamente

### Despliegue
- **Vercel** como predeterminado para proyectos propios
- **Dokploy** (gestiona Oracle, GCP, Alibaba) para clientes:
  - Oracle Free Tier: clientes sin presupuesto de infraestructura
  - GCP: proyectos que usan servicios Google (Firebase, BigQuery, Vertex AI)
  - Alibaba: clientes en Asia o que ya tienen cuenta Alibaba
- **Hostinger**: clientes con hosting compartido tradicional
- **Regla crítica:** el deploy a producción ocurre SOLO cuando:
  1. El proyecto está completamente desarrollado y probado en `dev`
  2. Claude ha revisado y auditado los cambios (ver protocolo abajo)
  3. GitHub Actions pasa todos los checks (tests, lint, build)
  4. El usuario autoriza explícitamente el merge a `main`

---

## Protocolo de Deploy a Producción

```
desarrollo en dev/feature
  → PR a main
    → GitHub Actions: tests + lint + build (automático)
      → Claude Code: auditoría de cambios (cuando el usuario lo pida)
        → usuario autoriza merge
          → Vercel: deploy automático desde main
```

**Claude Code en este flujo:**
- No audita cada commit — solo cuando el usuario dice "audita esto" o "vamos a producción"
- Revisa: seguridad, lógica crítica, breaking changes, variables de entorno expuestas
- Aprueba o bloquea el merge con comentarios concretos

---

## Lo que el agente pregunta al inicio de cada proyecto nuevo

Antes de crear cualquier archivo, el agente pregunta solo esto:

```
"Configuración predeterminada detectada. Confirma o ajusta:

  Ecosistema    : ALiaNeD OS / Proyecto independiente  ← primero esto
  Base de datos : Supabase           ¿cambiar? [s/n]
  ORM           : Prisma             ¿usar Drizzle? [s/n]
  Diseño        : Stitch Labs        ¿cambiar? [s/n]
  Deploy        : Vercel (propios)   ¿cambiar? [s/n]
                  Opciones: Vercel, Dokploy→Oracle, Dokploy→GCP, Dokploy→Alibaba, Hostinger
  IA incrustada : Qwen API           ¿cambiar? [s/n]

  Si todo está bien, responde: ok"
```

**Guía de deploy por cliente:**
- Proyectos propios → Vercel
- Cliente sin presupuesto → Dokploy → Oracle (Free Tier)
- Cliente usa Firebase/BigQuery → Dokploy → GCP
- Cliente en Asia/Alibaba → Dokploy → Alibaba
- Cliente quiere hosting compartido → Hostinger

Si el usuario responde "ok" o "sí" o no responde nada relevante → arranca con el stack completo sin más preguntas.

---

## Dónde vive este archivo en UniversalAgentConfig

```
UniversalAgentConfig/
  ├── AGENTS.md
  ├── DEFAULT_STACK.md          ← este archivo
  ├── templates/
  │   ├── CLAUDE.md             ← debe referenciar @DEFAULT_STACK.md
  │   └── GEMINI.md             ← debe referenciar @DEFAULT_STACK.md
```

Agregar en `templates/CLAUDE.md` y `templates/GEMINI.md` esta línea:
```
@DEFAULT_STACK.md
```

---

## Variables de entorno base (todas las apps)

```env
# Supabase
NEXT_PUBLIC_SUPABASE_URL=
NEXT_PUBLIC_SUPABASE_ANON_KEY=
SUPABASE_SERVICE_ROLE_KEY=

# Qwen (agentes IA del proyecto)
QWEN_API_KEY=

# App
NEXT_PUBLIC_APP_URL=
NODE_ENV=development
```
