# DELIVERY CHECKLIST — [PROYECTO] v[VERSION]

> Claude Code verifica esta lista antes de autorizar merge a main.
> El agente NO aprueba el merge si hay ítems críticos sin completar.

---

## Código
- [ ] Tests pasan localmente (`npm test`)
- [ ] Build sin errores (`npm run build`)
- [ ] Sin `console.log` de debug en el código
- [ ] Sin código comentado que no sea documentación
- [ ] TypeScript sin errores (`npm run type-check`)
- [ ] Snyk sin vulnerabilidades HIGH o CRITICAL

## Seguridad
- [ ] Variables de entorno NO hardcodeadas en el código
- [ ] `.env.example` actualizado con las nuevas variables
- [ ] `.env.local` NO está en git (verificar `.gitignore`)
- [ ] Supabase RLS activado en tablas nuevas
- [ ] API routes tienen autenticación donde corresponde

## Base de datos
- [ ] Migraciones Prisma versionadas en git
- [ ] Migración probada en entorno de staging
- [ ] Backup antes de migrar en producción

## Deploy
- [ ] Variables de entorno configuradas en Vercel/Dokploy/Hostinger
- [ ] Dominio apunta al servidor correcto
- [ ] SSL activo
- [ ] Health check de la app en staging pasa

## Entrega al cliente
- [ ] RUNBOOK.md actualizado
- [ ] Cliente tiene acceso al repositorio (si corresponde)
- [ ] Credenciales Supabase son del cliente (no las tuyas)
- [ ] Documentación de APIs actualizada
- [ ] CHANGELOG.md actualizado

## Post-deploy
- [ ] Verificar en producción que las funciones principales funcionan
- [ ] Monitoring activo (Sentry o similar)
- [ ] mem_save con resumen del deploy

---

**Autorizado por:** [agente o persona]
**Fecha:** [fecha]
**Versión deploydada:** [commit hash o tag]
