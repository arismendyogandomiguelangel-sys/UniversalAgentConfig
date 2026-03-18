# PROYECTO.md — Comando Universal de Proyecto
> Dale este archivo a cualquier agente (Claude Code, Gemini, Antigravity)
> al inicio de cualquier sesión de trabajo.
>
> El agente lee esto primero y te hace UNA sola pregunta.

---

## LO PRIMERO QUE HACE EL AGENTE

Al recibir este archivo, el agente lee:
1. Este archivo
2. `github.com/angelarismendyroa-lgtm/UniversalAgentConfig` → AGENTS.md
3. `github.com/angelarismendyroa-lgtm/UniversalAgentConfig` → ECOSYSTEM_SELECTOR.md

Luego hace UNA sola pregunta:

```
¿Qué necesitas hacer hoy?

 1. AUDITAR    → revisar un proyecto existente sin tocar nada
 2. CONTINUAR  → retomar un proyecto que ya está en curso
 3. CREAR      → comenzar un proyecto nuevo desde cero
```

---

## MODO 1 — AUDITAR UN PROYECTO EXISTENTE

```
Actúa como auditor de arquitectura de software senior.

Tienes acceso a los estándares en:
github.com/angelarismendyroa-lgtm/UniversalAgentConfig

Audita este proyecto y entrega un reporte con este formato exacto:

═══════════════════════════════════════
REPORTE DE AUDITORÍA: [nombre del proyecto]
Fecha: [hoy]
Auditor: [modelo que estás usando]
═══════════════════════════════════════

## 1. CLASIFICACIÓN
- Ecosistema: ALiaNeD OS / Proyecto independiente
- Sub-tipo: [GestiónApp / Smallter / One Do It / App web / Otro]
- Deploy target: [Vercel / Oracle / GCP / Alibaba / Hostinger]
- Incluye agentes MayordomIA: Sí / No / Parcial

## 2. ARCHIVOS DE CONFIGURACIÓN
Para cada archivo indica: ✅ Existe | ⚠️ Incompleto | ❌ Falta

- [ ] AGENTS.md
- [ ] CLAUDE.md o GEMINI.md
- [ ] ECOSYSTEM_SELECTOR.md
- [ ] PROJECT_BRIEF.md
- [ ] DEFAULT_STACK.md o equivalente
- [ ] .agent/context.md
- [ ] .agent/conventions.md
- [ ] .agent/handoffs/current-state.md
- [ ] .env.example
- [ ] .gitignore
- [ ] ROADMAP.md
- [ ] RUNBOOK.md
- [ ] DELIVERY_CHECKLIST.md
- [ ] mcp_config.json / .claude/settings.json

## 3. STACK TÉCNICO
- Base de datos: [detectado] vs [estándar: Supabase]
- ORM: [detectado] vs [estándar: Prisma/Drizzle]
- Deploy configurado: Sí / No
- CI/CD: Sí / No / Parcial
- Seguridad (Snyk): Sí / No

## 4. MEMORIA Y CONTINUIDAD
- Sistema de handoff entre sesiones: Existe / No existe
- Engram configurado: Sí / No
- Decisiones arquitectónicas documentadas: Sí / No / Parcial
- Riesgo de pérdida de contexto: 🔴 Alto / 🟡 Medio / 🟢 Bajo

## 5. TOP 3 RIESGOS CRÍTICOS
1. [riesgo más urgente] — [consecuencia si no se resuelve]
2. [segundo riesgo]
3. [tercer riesgo]

## 6. RECOMENDACIÓN
[ ] El proyecto está bien — solo aplicar archivos faltantes
[ ] El proyecto necesita ajustes importantes antes de continuar
[ ] El proyecto tiene riesgos de producción que resolver primero

## 7. PRÓXIMOS PASOS SUGERIDOS (en orden de prioridad)
1. [acción concreta]
2. [acción concreta]
3. [acción concreta]

═══════════════════════════════════════

NO hagas ningún cambio. Solo entrega el reporte.
Espera instrucciones del humano antes de actuar.
```

---

## MODO 2 — CONTINUAR UN PROYECTO EN CURSO

```
Actúa como el agente que continuó trabajando en este proyecto.

## Paso 1 — Orientación (haz esto antes de cualquier cosa)

Lee en este orden:
1. AGENTS.md → protocolo de inicio de sesión
2. .agent/handoffs/current-state.md → dónde lo dejó el agente anterior
3. ROADMAP.md → estado actual del sprint
4. .agent/context.md → qué es este proyecto

Si alguno de esos archivos NO existe, dímelo antes de continuar.
Si current-state.md no existe: es urgente crearlo ahora.

## Paso 2 — Resumen de orientación

Antes de escribir una línea de código, dime:

"Retomando el proyecto [nombre].
 Último trabajo completado: [X]
 Estado actual: [Y]
 Próxima acción concreta: [Z]
 ¿Procedo?"

## Paso 3 — Espera mi confirmación

Solo después de que yo diga "sí" o "procede", empieza a trabajar.

## Paso 4 — Al terminar la sesión

Antes de cerrar, actualiza:
1. .agent/handoffs/current-state.md con el estado actual
2. ROADMAP.md si completaste algún milestone
3. Haz commit: git add -A && git commit -m "wip: [qué hiciste]"
4. Llama mem_save si tomaste decisiones importantes
```

---

## MODO 3 — CREAR UN PROYECTO NUEVO DESDE CERO

```
Vamos a crear un proyecto nuevo desde cero.
Sigue este proceso exacto, paso a paso, esperando mi confirmación en cada uno.

## Paso 1 — Ecosistema (espera mi respuesta)

¿En qué ecosistema va este proyecto?

 1. ALiaNeD OS (Oracle · Dokploy · módulos ERP)
 2. Proyecto independiente

## Paso 2 — Brief del proyecto (hazme estas preguntas, una por una)

No las hagas todas de golpe. Una pregunta, espera respuesta, siguiente pregunta.

Pregunta 1: ¿Cuál es el nombre del proyecto?
Pregunta 2: ¿Qué problema resuelve? (una sola oración)
Pregunta 3: ¿Quién es el usuario final?
Pregunta 4: ¿Qué NO debe hacer este proyecto?
Pregunta 5: ¿Cuál es la fecha límite o criterio de éxito?

## Paso 3 — Stack (muestra resumen, espera confirmación)

Muestra el stack predeterminado según DEFAULT_STACK.md
y pregunta:

"¿Confirmas este stack o hay algo que cambiar?
 Si todo está bien responde: ok"

Si el ecosistema es ALiaNeD, agrega las preguntas de:
- ¿Qué sub-producto? (GestiónApp / Smallter / One Do It / Módulo nuevo)
- ¿Incluye agentes MayordomIA? ¿De qué tipo?

## Paso 4 — Deploy (pregunta antes de configurar)

¿Dónde se despliega este proyecto?
 1. Vercel (predeterminado)
 2. Dokploy → Oracle
 3. Dokploy → GCP
 4. Dokploy → Alibaba
 5. Hostinger
 6. Servidor propio del cliente → ¿cuál?

## Paso 5 — Crear la estructura

Una vez confirmado todo lo anterior:

1. Crea el directorio del proyecto
2. Aplica templates de UniversalAgentConfig:
   curl -fsSL https://raw.githubusercontent.com/angelarismendyroa-lgtm/UniversalAgentConfig/main/scripts/apply.sh | bash
   (o en Windows: irm .../apply.ps1 | iex)
3. Llena .agent/context.md con lo que respondiste en el Brief
4. Llena PROJECT_BRIEF.md completo
5. Crea el repo en GitHub:
   gh repo create [nombre] --private
6. Primer commit:
   git add -A && git commit -m "feat: init [nombre] — [descripción breve]"
   git push -u origin main

## Paso 6 — Confirma y arranca

Muéstrame:
- Árbol del proyecto creado
- URL del repo en GitHub
- Próximo paso de desarrollo

Luego pregunta: "¿Empezamos con la Fase Explore del SDD o prefieres algo específico primero?"
```

---

## CÓMO USAR ESTE ARCHIVO

**Opción A — Dáselo directamente al agente:**
```
Lee el archivo PROYECTO.md y hazme la primera pregunta.
```

**Opción B — Dile directamente qué modo:**
```
Lee PROYECTO.md y ejecuta el MODO 1 (auditar) sobre este proyecto.
Lee PROYECTO.md y ejecuta el MODO 2 (continuar) — estamos en Casa Lista.
Lee PROYECTO.md y ejecuta el MODO 3 (crear) — nuevo proyecto.
```

**Opción C — Guárdalo en UniversalAgentConfig:**
Este archivo debe vivir en la raíz de UniversalAgentConfig
para que siempre esté disponible en cualquier proyecto.
