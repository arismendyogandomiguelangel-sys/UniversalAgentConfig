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

### Vercel (proyectos propios)
- Deploy automático desde `main`
- Panel: https://vercel.com/dashboard
- Variables de entorno: Vercel → Settings → Environment Variables
- Redeploy: `vercel --prod` o push vacío a main

### Dokploy — Oracle Cloud (clientes sin presupuesto)
- Panel: [URL_DOKPLOY_ORACLE]
- Servidor: Oracle Cloud Free Tier
- Redeploy: Dashboard → [app] → Deploy
- Logs: Dashboard → [app] → Logs

### Dokploy — GCP (proyectos Google ecosystem)
- Panel: [URL_DOKPLOY_GCP]
- Servidor: Google Cloud Platform
- Usa: Firebase, BigQuery, Vertex AI
- Redeploy: Dashboard → [app] → Deploy

### Dokploy — Alibaba Cloud (clientes Asia)
- Panel: [URL_DOKPLOY_ALIBABA]
- Servidor: Alibaba Cloud (Hong Kong/Singapore)
- Redeploy: Dashboard → [app] → Deploy

### Hostinger (hosting compartido)
- Panel: [COMPLETAR según el cliente]
- FTP/SFTP para deploy manual
- Panel de hosting: hpanel.hostinger.com

---

## Rollback de emergencia

### Vercel
```bash
# Ver deployments anteriores
vercel ls

# Hacer rollback al anterior
vercel rollback [deployment-url]
```

### Dokploy (cualquier servidor)
- Dashboard → [app] → Deployments → seleccionar versión anterior → Rollback
- O: Dashboard → [app] → Actions → Restart (reinicia contenedor)

### Hostinger
- Panel → Site → Backups → Restore
- O: Subir archivos manualmente por FTP

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
| GOOGLE_APPLICATION_CREDENTIALS | GCP Console → IAM → Service Accounts | [COMPLETAR] (solo GCP) |
| GCP_PROJECT_ID | GCP Console → Home | [COMPLETAR] (solo GCP) |

### Por servidor
- **Vercel**: Dashboard → Settings → Environment Variables
- **Dokploy Oracle**: Panel → App → Environment
- **Dokploy GCP**: Panel → App → Environment
- **Dokploy Alibaba**: Panel → App → Environment
- **Hostinger**: hPanel → Files → .env manager

---

## Contactos de emergencia

| Rol | Nombre | Contacto |
|-----|--------|----------|
| Dev principal | [COMPLETAR] | [COMPLETAR] |
| Cliente | [COMPLETAR] | [COMPLETAR] |

---

*Última actualización: [fecha]*
