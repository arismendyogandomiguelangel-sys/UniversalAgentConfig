---
name: ai-fallback
description: "Implementar manejo de errores y fallbacks para APIs de IA incrustadas en el proyecto. Usar cuando el proyecto tiene agentes Qwen u otra IA integrada. Garantiza que la app funcione aunque la IA falle."
---

# AI Fallback Skill

## Tu rol
Implementar un sistema de fallback robusto para todas las llamadas a la API de IA del proyecto.
La app NUNCA debe romperse por un error de la API de IA.

## Patrón base a implementar

```typescript
// lib/ai-client.ts
const AI_TIMEOUT_MS = 10000
const MAX_RETRIES = 2

export async function callAI(prompt: string, options = {}) {
  for (let attempt = 0; attempt <= MAX_RETRIES; attempt++) {
    try {
      const response = await Promise.race([
        qwenClient.chat(prompt, options),
        new Promise((_, reject) =>
          setTimeout(() => reject(new Error('timeout')), AI_TIMEOUT_MS)
        )
      ])
      return { success: true, data: response }
    } catch (error) {
      if (attempt === MAX_RETRIES) {
        // Log para monitoreo
        console.error('[AI Fallback]', error)
        // Retornar fallback, nunca throw
        return {
          success: false,
          fallback: true,
          message: process.env.NEXT_PUBLIC_AI_FALLBACK_MESSAGE
            ?? 'El asistente no está disponible. Intenta en unos minutos.'
        }
      }
      // Esperar antes de reintentar
      await new Promise(r => setTimeout(r, 1000 * (attempt + 1)))
    }
  }
}
```

## Checklist de implementación
- [ ] Todas las llamadas a IA pasan por `callAI()` — nunca directo al cliente
- [ ] UI muestra estado de carga mientras espera
- [ ] UI muestra mensaje amigable cuando `fallback: true`
- [ ] Features de IA desactivables con feature flag
- [ ] Variable `NEXT_PUBLIC_AI_FALLBACK_MESSAGE` en `.env.example`
- [ ] Timeout configurado (nunca dejar una llamada colgada)
- [ ] Logs de errores van a Sentry o similar

## Input necesario
- Qué features del proyecto usan IA
- Qué debe hacer la app si la IA no responde

## Output
- `lib/ai-client.ts` con el wrapper de fallback
- Componente `<AIStatus />` para mostrar estado al usuario
- Variable de entorno documentada en `.env.example`
