# QUICKSTART

## Aplicar a un proyecto nuevo

Windows:
```
irm https://raw.githubusercontent.com/angelarismendyroa-lgtm/UniversalAgentConfig/main/scripts/apply.ps1 | iex
```

Mac/Linux:
```
curl -fsSL https://raw.githubusercontent.com/angelarismendyroa-lgtm/UniversalAgentConfig/main/scripts/apply.sh | bash
```

## Después de aplicar
1. Edita .agent/context.md con la descripción del proyecto
2. Llena PROJECT_BRIEF.md con el cliente
3. Dile al agente:
   "Aplica los estándares de UniversalAgentConfig.
    Lee AGENTS.md y PROJECT_BRIEF.md antes de empezar."

## Stack predeterminado
Ver DEFAULT_STACK.md — el agente pregunta confirmación antes de arrancar.
