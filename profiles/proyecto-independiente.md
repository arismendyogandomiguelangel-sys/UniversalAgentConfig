# Perfil: Proyecto Independiente

> Carga este perfil cuando el proyecto es desconectado del framework ALiaNeD.
> Puede estar en cualquier servidor — Oracle, GCP, Alibaba, Vercel, Hostinger.

---

## Stack predeterminado
Ver DEFAULT_STACK.md — aplica sin modificaciones.

## Si incluye agentes MayordomIA Comerciales

El proyecto puede incluir uno o más de los tres perfiles nucleares:

### Recepcionista
- Orientado a clientes externos del cliente
- Canal: WhatsApp, web widget, voz
- Base: perfil Abigail adaptado a la empresa del cliente
- Personalizable: nombre, personalidad, módulos de conocimiento

### Supervisor
- Orientado a gestión interna del cliente
- Base: perfil José adaptado
- Acceso restringido a roles definidos por el cliente

### Asesor
- Orientado al dueño/directivo del cliente
- Base: perfil Daniel adaptado
- Especialización según industria del cliente

## Regla de personalización

Los tres perfiles son el núcleo. El cliente los puede personalizar:
- Nombre (Axel, María, Miguel, etc.)
- Especialidad (odontología, restaurante, call center)
- Canales (solo texto, texto + voz, solo WhatsApp)
- Escala (1 instancia, múltiples por departamento)

Pero en su raíz siempre tendrá uno de los 3 perfiles: Recepcionista, Supervisor o Asesor.

## Arquitectura de resiliencia (si aplica)

Si el proyecto independiente incluye agentes modulares,
aplicar la misma arquitectura de 3 capas que ALiaNeD:
- Capa 1: workflow n8n raíz (siempre activo)
- Capa 2: agente del módulo (controlado por Flowise)
- Capa 3: supervisor (opcional, si la escala lo requiere)
