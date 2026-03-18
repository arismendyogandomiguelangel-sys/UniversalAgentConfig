# Selector de Ecosistema — ALiaNeD Agency

> Este es el primer archivo que lee el agente antes de PROJECT_BRIEF.md.
> Define en qué universo se construye este proyecto.

---

## Pregunta 1 — Ecosistema

```
¿En qué ecosistema vas a desarrollar este proyecto?

  1. ALiaNeD OS          → solución dentro del framework ALiaNeD
                           (Oracle server · Dokploy · módulos ERP)
  2. Proyecto independiente → app/web/sistema desconectado de ALiaNeD
                           (puede ser en Oracle, GCP, Alibaba, Vercel, Hostinger)

  Predeterminado si no respondes: ALiaNeD OS
```

---

## Pregunta 2 — Solo si eligió opción 2 (Proyecto independiente)

```
¿Este proyecto incluye agentes MayordomIA?

  1. Sí — incluye agentes comerciales (Recepcionista/Supervisor/Asesor)
  2. Sí — incluye agentes contratistas/constructores internos
  3. No — es una app/web sin agentes de IA
  4. Aún no lo sé
```

---

## Pregunta 3 — Solo si es ALiaNeD OS

```
¿Qué sub-producto de ALiaNeD es?

  1. GestiónApp    → pequeños negocios (1-15 empleados)
  2. Smallter      → empresas medianas/grandes (15+ empleados)
  3. One Do It     → Marketplace
  4. Módulo nuevo  → nuevo módulo para ecosistema existente
  5. Personalizado → configuración especial del cliente
```

---

## Regla sobre servidores

⚠️ Un cliente con servidor Oracle no es automáticamente un proyecto ALiaNeD.
La pregunta es sobre el ECOSISTEMA, no sobre la infraestructura.

- Cliente con Oracle + quiere ALiaNeD → Opción 1
- Cliente con Oracle + quiere app independiente → Opción 2
- El agente SIEMPRE pregunta, nunca asume por el servidor.
