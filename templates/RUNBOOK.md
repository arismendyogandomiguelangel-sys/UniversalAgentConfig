# RUNBOOK — [NOMBRE DEL PROYECTO]

> Este documento responde: ¿qué hago cuando algo falla en producción?
> Actualizar cada vez que cambie algo de infraestructura.

---

## Levantar el proyecto desde cero

### Requisitos previos
- Node.js 20+
- Git
- Cuenta Supabase con proyecto creado
- Variables de entorno (ver `.env.example`)

### Pasos
```bash
git clone [repo-url]
cd [proyecto]
npm install
cp .env.example .env.local
# Llenar .env.local con los valores reales
npx prisma migrate dev
npm run dev
```

---

## Deploy

### Vercel (predeterminado)
- Deploy automático desde `main`
- Variables de entorno en: Vercel Dashboard → Settings → Environment Variables
- Para forzar redeploy: `vercel --prod` o push vacío a main

### Dokploy
- Panel en: [URL del servidor del cliente]
- Para redeploy: Dokploy Dashboard → [app] → Deploy
- Logs en: Dokploy Dashboard → [app] → Logs

### Hostinger
- [COMPLETAR según el cliente]

---

## Rollback de emergencia

### Vercel
```bash
# Ver deployments anteriores
vercel ls

# Hacer rollback al anterior
vercel rollback [deployment-url]
```

### Dokploy
- Dashboard → [app] → Deployments → seleccionar versión anterior → Rollback

---

## Base de datos (Supabase)

### Backup manual
```bash
npx supabase db dump -f backup-$(date +%Y%m%d).sql
```

### Restaurar backup
```bash
psql [DATABASE_URL] < backup-YYYYMMDD.sql
```

### Migración fallida
```bash
# Ver estado de migraciones
npx prisma migrate status

# Revertir última migración
npx prisma migrate reset  # ⚠️ DESTRUCTIVO — solo en dev
```

---

## Variables de entorno

| Variable | Dónde obtenerla | Quién la tiene |
|----------|----------------|----------------|
| NEXT_PUBLIC_SUPABASE_URL | Supabase Dashboard → Settings → API | [COMPLETAR] |
| SUPABASE_SERVICE_ROLE_KEY | Supabase Dashboard → Settings → API | [COMPLETAR] |
| QWEN_API_KEY | DashScope Console | [COMPLETAR] |

---

## Contactos de emergencia

| Rol | Nombre | Contacto |
|-----|--------|----------|
| Dev principal | [COMPLETAR] | [COMPLETAR] |
| Cliente | [COMPLETAR] | [COMPLETAR] |

---

*Última actualización: [fecha]*
