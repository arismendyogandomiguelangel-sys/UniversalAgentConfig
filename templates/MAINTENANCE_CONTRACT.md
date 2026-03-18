# CONTRATO DE MANTENIMIENTO — [NOMBRE DEL PROYECTO]

> Documento para el cliente que define claramente qué está incluido
> en el mantenimiento y qué genera costo adicional.
> Evita malentendidos y protege tu tiempo.

---

## ¿Qué está incluido?

### Mantenimiento base (incluido en el precio acordado)
- Actualizaciones de seguridad críticas (cuando Snyk detecta vulnerabilidades HIGH/CRITICAL)
- Corrección de bugs reportados que existían al momento de la entrega
- Monitoreo básico — si algo se cae, te avisamos

### NO está incluido (requiere cotización adicional)
- Nuevas funcionalidades o cambios en los requerimientos originales
- Actualizaciones de librerías por preferencia (no por seguridad)
- Cambios en el diseño o UI
- Integración de nuevas APIs o servicios
- Migración a otra plataforma de deploy
- Capacitación al equipo del cliente

---

## Infraestructura

### Qué administramos nosotros
- Código fuente en GitHub
- Pipeline de CI/CD (GitHub Actions)
- Configuración de deploy (Vercel/Dokploy/Hostinger)

### Qué administra el cliente
- Cuenta de Supabase y sus datos
- Claves de API (Qwen, servicios externos)
- Dominio y DNS
- Facturación de infraestructura

---

## APIs de IA incrustadas

- Modelo: Qwen — presupuesto acordado: $[COMPLETAR]/mes
- Si el consumo supera el límite: [COMPLETAR — quién paga el exceso]
- El cliente es responsable de su propia clave API en producción

---

## Tiempo de respuesta

| Severidad | Definición | Tiempo de respuesta |
|-----------|-----------|-------------------|
| Crítico | App caída en producción | 4 horas hábiles |
| Alto | Feature principal no funciona | 24 horas hábiles |
| Medio | Bug menor con workaround | 72 horas hábiles |
| Bajo | Mejora o pregunta | Próxima iteración |

---

## Duración y renovación
- Período inicial: [COMPLETAR]
- Renovación: [automática / manual]
- Cancelación: aviso con [X] días de anticipación

---

*Versión: 1.0*
*Fecha: [fecha]*
*Aceptado por el cliente: [ ] sí / [ ] pendiente*
