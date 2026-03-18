# Aplicar UniversalAgentConfig a Proyecto Existente

> Usa este archivo cuando quieras aplicar o auditar UniversalAgentConfig
> en un proyecto que ya está en curso.
>
> Díselo al agente con este mensaje:
> "Lee APPLY_TO_EXISTING_PROJECT.md y sigue las instrucciones."

---

## FASE 1 — Diagnóstico (sin tocar nada)

```
Eres un auditor de arquitectura de software.

Tienes acceso a dos cosas:
1. El repositorio de estándares: github.com/angelarismendyroa-lgtm/UniversalAgentConfig
2. El proyecto actual en el que estamos trabajando

Tu tarea es hacer un diagnóstico completo ANTES de hacer cualquier cambio.

## Paso 1 — Lee los estándares
Clona o lee estos archivos de UniversalAgentConfig:
- AGENTS.md
- ECOSYSTEM_SELECTOR.md
- DEFAULT_STACK.md
- profiles/alianed-os.md
- profiles/proyecto-independiente.md

## Paso 2 — Analiza el proyecto actual
Revisa la estructura del proyecto y responde:

### A) Clasificación del ecosistema
Según ECOSYSTEM_SELECTOR.md:
- ¿Es un proyecto ALiaNeD o independiente?
- ¿Incluye agentes MayordomIA?
- ¿En qué servidor va a desplegarse?

### B) Archivos de configuración faltantes
Verifica si existen estos archivos. Para cada uno di si existe,
está incompleto, o falta completamente:

- [ ] AGENTS.md en la raíz
- [ ] CLAUDE.md o GEMINI.md en la raíz
- [ ] .agent/context.md
- [ ] .agent/conventions.md
- [ ] .agent/handoffs/current-state.md
- [ ] PROJECT_BRIEF.md
- [ ] .env.example
- [ ] .gitignore
- [ ] mcp_config.json (si usa Antigravity)
- [ ] .claude/settings.json (si usa Claude Code)
- [ ] ROADMAP.md

### C) Stack técnico
Compara el stack del proyecto contra DEFAULT_STACK.md:
- ¿Usa Supabase o otra base de datos?
- ¿Usa Prisma o Drizzle?
- ¿Está configurado el deploy? ¿Dónde?
- ¿Tiene GitHub Actions / CI configurado?
- ¿Tiene Snyk o algún scanner de seguridad?

### D) Estado de la memoria
- ¿Existe algún sistema de handoff entre sesiones?
- ¿Hay decisiones arquitectónicas documentadas en algún lado?
- ¿Engram está configurado como MCP?

### E) Riesgos detectados
Lista los 3 riesgos más críticos que ves en el proyecto
desde el punto de vista de:
- Continuidad (si cambias de agente o se acaben tokens)
- Producción (si se despliega algo que no debería)
- Seguridad (variables expuestas, auth, etc.)

## Paso 3 — Entrega el diagnóstico en este formato

---
DIAGNÓSTICO: [nombre del proyecto]
Ecosistema: ALiaNeD / Independiente
Deploy target: [donde va]

ARCHIVOS FALTANTES (críticos primero):
1. [archivo] — [impacto si no existe]
2. ...

STACK:
- Alineado con estándares: [sí/no/parcial]
- Diferencias: [lista]

MEMORIA Y CONTINUIDAD:
- Estado: [sin sistema / parcial / completo]
- Riesgo: [alto/medio/bajo]

TOP 3 RIESGOS:
1. [riesgo] — [consecuencia]
2. ...

RECOMENDACIÓN:
[ ] Aplicar configuración completa desde cero
[ ] Aplicar solo los archivos faltantes
[ ] Solo auditar, no cambiar nada todavía
---

No hagas ningún cambio hasta que el humano confirme qué opción prefiere.
```

---

## FASE 2 — Aplicar (solo después del diagnóstico)

Una vez que el humano revisa el diagnóstico y decide, usa este prompt:

```
Basándote en el diagnóstico anterior, aplica la opción que elegí:

OPCIÓN A — Aplicar archivos faltantes solamente:
"Crea solo los archivos que faltan según el diagnóstico.
 No modifiques nada que ya exista.
 Para cada archivo creado, dime qué pusiste y por qué."

OPCIÓN B — Aplicar configuración completa:
"Descarga los templates de UniversalAgentConfig y aplícalos
 al proyecto. Si ya existe un archivo, muéstrame las diferencias
 antes de sobreescribir."

OPCIÓN C — Solo auditar, generar reporte:
"Genera un archivo AUDIT_REPORT.md en la raíz del proyecto
 con el diagnóstico completo. No crees ni modifiques ningún
 otro archivo."

Cuando termines, muéstrame:
1. Lista de archivos creados o modificados
2. Próximo paso recomendado
3. Si detectaste algo urgente que resolver antes de continuar
```

---

## FASE 3 — Llenar el contexto del proyecto

Después de aplicar los archivos, el agente llena estos archivos
con la información real del proyecto:

```
Ahora llena estos archivos con la información real del proyecto:

1. .agent/context.md — describe qué es este proyecto,
   su stack real, sus usuarios, su estado actual

2. .agent/handoffs/current-state.md — describe:
   - Qué está construido y funcionando
   - Qué está en construcción ahora mismo
   - Cuál es el próximo paso concreto
   - Qué decisiones importantes se han tomado
   - Qué NO se debe tocar

3. PROJECT_BRIEF.md — si no existe, hazme las preguntas
   necesarias para llenarlo (una por una, no todas de golpe)

Cuando termines, haz commit con:
"chore: apply UniversalAgentConfig standards to [nombre proyecto]"
```

---

## Cómo usar este archivo

```
"Dime: Lee APPLY_TO_EXISTING_PROJECT.md y sigue las instrucciones."
```

El agente hará el diagnóstico y esperará tu confirmación para aplicar los cambios.
