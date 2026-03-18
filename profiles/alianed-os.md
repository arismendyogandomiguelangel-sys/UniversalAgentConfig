# Perfil: ALiaNeD OS

> Carga este perfil cuando el proyecto es una solución dentro del framework ALiaNeD.

---

## Infraestructura ALiaNeD
- Servidor principal: Oracle Cloud Free Tier (gestionado en Dokploy)
- Servidores adicionales: GCP, Alibaba Cloud (según módulo)
- Orquestación: Dokploy + n8n + Flowise
- Monitoreo: Grafana
- Base de datos: Supabase (PostgreSQL) por módulo

## Stack ALiaNeD
- Frontend: Next.js + Stitch Labs + Zustand
- Backend: Node/Bun + Prisma
- Agentes modulares: n8n workflows
- HITL: Flowise (control humano de aprobaciones)
- Monitoreo: Grafana dashboards

## Los tres agentes comerciales ALiaNeD

### Abigail — Recepcionista (orientada a clientes externos)
- Canal: WhatsApp, módulo de mensajería, interfaz recepcionista
- Acceso: clientes, recepcionistas, empleados vía WhatsApp
- Capacidades base: texto, voz (plan premium), atención 24/7
- Escala horizontal: múltiples Abigails por departamento/sucursal
- No tiene acceso a: datos internos de gestión, módulos ERP

### José — Supervisor (orientada a gestión interna)
- Canal: interfaz ALiaNeD interna
- Acceso: gerencia y directores (NO clientes, NO recepción)
- Capacidades: orquesta módulos, ejecuta acciones en ERP, sub-agentes por depto
- Escala horizontal: un José por departamento/sucursal, admin = director
- Arquitectura de resiliencia:
  - Capa 1: workflow n8n raíz del módulo (siempre activo, independiente)
  - Capa 2: agente del módulo (conectado a José, controlado por Flowise)
  - Capa 3: José supervisa todo — si José se apaga, capas 1 y 2 siguen activas

### Daniel — Asesor CEO (orientado a visión estratégica)
- Canal: interfaz exclusiva, máximo 5 usuarios (plan estándar)
- Acceso: CEO/fundador y directores asignados
- Lado izquierdo: datos internos de José + Abigail (empresa en tiempo real)
- Lado derecho: MCP de investigación externa (mercado, industria, competencia)
  - Bright Data, NotebookLM, Perplexity según profesión del CEO
  - Ejemplo CEO contador: leyes tributarias, libros contables, economía
  - Ejemplo CEO restaurante: recetas, precios materias primas, temporadas
- Escala vertical: crece en profundidad, no en cantidad
- Sub-agente n8n por módulo: solo monitorea, NO ejecuta (solo José ejecuta)
- Puede sugerir órdenes a José pero requiere aprobación humana

## Perfiles de interacción (aplican a los 3 agentes)

### Secretario (H75 / IA25)
El humano planifica y dirige. La IA ejecuta sin cuestionar.
Ideal cuando el humano ya sabe qué hacer y necesita ejecución eficiente.
La IA espera instrucciones, no toma iniciativa.

### Partner (H50 / IA50)
Colaboración real. Cuando el humano razona, la IA ejecuta (tablas, presentaciones).
Cuando el humano actúa, la IA colaborar (organiza, analiza).
Como Tony Stark y Bruce Banner: aportan cosas distintas, sin jerarquía.

### Asesor (H25 / IA75)
La IA es el experto. Enseña, explica, guía cada decisión.
Ideal para aprender una disciplina o tomar decisiones informadas.
La IA presenta datos, videos, informes de manera enseñable.
El objetivo: que el humano piense como el experto.

## Interfaz ALiaNeD (referencia para proyectos de interfaz)

### Barra orquestadora (2 líneas, 4 iconos)
- Izq 1: Carpeta → adjunta módulo ALiaNeD (atención al cliente, contabilidad, etc.)
- Izq 2: Modo predeterminado → Secretario / Partner / Asesor
- Der 1: Micrófono/bocina → voz bidireccional
- Der 2: Expandir → modos de visualización

### Modos de visualización
1. Barra compacta → modo default
2. Un click → Chatbot (imágenes, documentos, productos)
3. Otro click → Pizarra colaborativa (co-escritura, presentaciones, streaming)
4. Otro click → Nube (acceso desde celular, auto, reloj — plan premium)

### Temas visuales
- Transparente/vidrio ahumado (día/noche) con selector de fondos
- Negro carbón / blanco perla
- Tema Ella y Él: azul profesional / rosa suave
- Colores logo: rojo, amarillo, verde, azul (gradientes suaves)
- Fondos seleccionables: sala de juntas, vista de avión, sala de estar con librería
