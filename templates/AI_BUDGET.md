# AI BUDGET — [NOMBRE DEL PROYECTO]

> Define cuánto gasta este proyecto en APIs de IA por mes.
> Evita sorpresas en la factura del cliente o la tuya.
> Revisar cada mes — si se supera el 80% del límite, alertar al cliente.

---

## Modelo principal (agentes incrustados)
- Proveedor: **Qwen (DashScope)**
- Modelo: qwen-coder-plus / qwen-turbo / [especificar]
- Uso estimado: [X] llamadas/día × [Y] tokens promedio
- Costo estimado: $[Z] / mes

## Límite mensual acordado con el cliente
- Límite: $[COMPLETAR] / mes
- Qué pasa si se supera: [COMPLETAR — ¿el cliente paga el exceso? ¿se pausa el servicio?]

## Fallback si la API de Qwen falla o se agota
> El proyecto NUNCA debe romperse por falta de tokens.
> Define aquí qué hace el sistema cuando la IA no responde.

- Nivel 1 — API lenta (>3s): mostrar indicador de carga, reintentar 1 vez
- Nivel 2 — API error 5xx: usar respuesta en caché si existe, si no mostrar mensaje
- Nivel 3 — API caída total: desactivar features de IA, app funciona sin ellas
- Mensaje de fallback al usuario: "[COMPLETAR — algo como 'El asistente no está disponible ahora, intenta en unos minutos']"

## Variables de entorno relacionadas
```env
QWEN_API_KEY=
QWEN_MONTHLY_BUDGET_USD=50
QWEN_FALLBACK_ENABLED=true
```

## Monitoreo
- Dónde ver el consumo: DashScope Console → Usage
- Alerta al 80% del límite: [COMPLETAR — email, Slack, etc.]

---

*Última revisión: [fecha]*
