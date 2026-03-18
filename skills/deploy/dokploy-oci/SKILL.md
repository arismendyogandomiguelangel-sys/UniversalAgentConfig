---
name: dokploy-multi-cloud
description: "Multi-cloud deployment with Dokploy. Deploy to Oracle Cloud, GCP, or Alibaba Cloud from a single panel."
---

# Dokploy — Multi-Cloud Deployment

## Tu Rol
Desplegar aplicaciones usando Dokploy en múltiples proveedores de nube:
- **Oracle Cloud** (Free Tier) — clientes sin presupuesto
- **Google Cloud Platform** — proyectos con ecosistema Google
- **Alibaba Cloud** — clientes en Asia o con cuenta Alibaba

Un solo panel Dokploy gestiona los 3 servidores.

---

## Arquitectura

```
                    ┌─────────────────────────────────────┐
                    │        PANEL DOKPLOY                │
                    │   (accedes desde Windows local)     │
                    └──────────────┬──────────────────────┘
                                   │
           ┌───────────────────────┼───────────────────────┐
           │                       │                       │
           ▼                       ▼                       ▼
    ┌──────────────┐      ┌──────────────┐      ┌──────────────┐
    │   ORACLE     │      │     GCP      │      │  ALIBABA     │
    │   CLOUD      │      │   CLOUD      │      │   CLOUD      │
    │ Free Tier    │      │              │      │              │
    └──────────────┘      └──────────────┘      └──────────────┘
```

---

## Cuándo Usar Qué Servidor

| Cliente/Proyecto | Servidor Dokploy |
|-----------------|------------------|
| Sin presupuesto de infraestructura | Oracle Cloud (Free Tier) |
| Usa Firebase, BigQuery, Vertex AI | GCP |
| Cliente en Asia o tiene cuenta Alibaba | Alibaba Cloud |
| Proyecto propio / rápido prototipado | Vercel |

---

## 1. Oracle Cloud Free Tier

### Configuración Inicial (solo una vez)

1. **Crear cuenta**: https://cloud.oracle.com (sin tarjeta de crédito)

2. **Crear instancia**:
   - Compute → Instances
   - Image: Ubuntu 22.04
   - Shape: VM.Standard.A1.Flex (4 OCPUs, 24GB RAM - ¡gratis!)
   - SSH Key: guardar la clave privada

3. **Instalar Dokploy**:
   ```bash
   ssh -i clave-privada ubuntu@IP_PUBLICA
   curl -sL https://docs.dokploy.com/install.sh | sh
   ```

4. **Acceder al panel**:
   - URL: `https://IP_PUBLICA`
   - Crear usuario admin

### Deploy a Oracle

1. Dokploy Dashboard → New Project
2. New Application → Next.js/Node.js
3. Configurar:
   - Build: `npm run build`
   - Start: `npm start`
   - Port: 3000
4. Repository: conectar GitHub
5. Environment: agregar variables
6. Deploy

---

## 2. Google Cloud Platform (GCP)

### Configuración Inicial

1. **Crear proyecto GCP**: https://console.cloud.google.com

2. **Crear VM**:
   - Compute Engine → VM Instances
   - Machine: e2-medium (~$15/mes) o custom
   - Boot disk: Ubuntu 22.04
   - Firewall: permitir HTTP/HTTPS

3. **Instalar Dokploy**:
   ```bash
   ssh ubuntu@IP_VM_GCP
   curl -sL https://docs.dokploy.com/install.sh | sh
   ```

### Por qué GCP para Proyectos Google

- **Vertex AI**: modelos AI de Google
- **Firebase**: autenticación, base de datos
- **BigQuery**: analytics
- **Cloud Functions**: serverless
- **Cloud Storage**: archivos

### Deploy a GCP

Same process as Oracle, but:
- Environment variables pueden incluir:
  ```
  GOOGLE_APPLICATION_CREDENTIALS=/app/credentials.json
  GCP_PROJECT_ID=tu-proyecto
  ```

---

## 3. Alibaba Cloud

### Configuración Inicial

1. **Crear cuenta**: https://alibabacloud.com

2. **Crear instancia ECS**:
   - ECS Console → Instances
   - Region: Hong Kong o Singapore (menor latencia)
   - Instance Type: ecs.t6 (bajo costo)
   - OS: Ubuntu 22.04

3. **Instalar Dokploy**:
   ```bash
   ssh ubuntu@IP_ALIBABA
   curl -sL https://docs.dokploy.com/install.sh | sh
   ```

### Por qué Alibaba para Clientes Asia

- **Menor latencia** desde China/Asia
- **Alibaba Cloud** es el AWS de China
- Si el cliente ya tiene cuenta, usarla

---

## Variables de Entorno por Servidor

### Oracle (Free Tier)
```
NEXT_PUBLIC_SUPABASE_URL=
NEXT_PUBLIC_SUPABASE_ANON_KEY=
SUPABASE_SERVICE_ROLE_KEY=
QWEN_API_KEY=
```

### GCP (con servicios Google)
```
NEXT_PUBLIC_SUPABASE_URL=
NEXT_PUBLIC_SUPABASE_ANON_KEY=
SUPABASE_SERVICE_ROLE_KEY=
QWEN_API_KEY=
GOOGLE_APPLICATION_CREDENTIALS=
GCP_PROJECT_ID=
NEXT_PUBLIC_FIREBASE_API_KEY=
NEXT_PUBLIC_FIREBASE_PROJECT_ID=
```

### Alibaba (Asia)
```
NEXT_PUBLIC_SUPABASE_URL=
NEXT_PUBLIC_SUPABASE_ANON_KEY=
SUPABASE_SERVICE_ROLE_KEY=
QWEN_API_KEY=
ALIBABA_ACCESS_KEY_ID=
ALIBABA_ACCESS_KEY_SECRET=
```

---

## Rollback desde Dokploy

### Panel (todos los servidores)
1. Ve a tu aplicación en Dokploy
2. Busca la sección **Deployments** o **Versions**
3. Selecciona la versión anterior
4. Click **Rollback** o **Redeploy**

### Línea de comandos
```bash
# Desde el servidor
cd /home/dokploy/applications/tu-app
docker-compose restart
```

### Recuperar versión específica
- Dokploy guarda historial de deployments
- Puedes redeployar cualquier commit anterior

---

## Configurar Dominios Custom

### Oracle Cloud
1. Comprar dominio (Namecheap, Cloudflare)
2. DNS → A Record → IP de Oracle
3. En Dokploy: Settings → Domain → agregar dominio
4. Let's Encrypt se configura automático

### GCP
1. Cloud DNS o usar proveedor externo
2. A Record → IP de la VM de GCP
3. En Dokploy: Settings → Domain
4. SSL: Let's Encrypt o Cloud Armor

### Alibaba
1. Aliyun DNS (barato)
2. A Record → IP de Alibaba
3. En Dokploy: Settings → Domain

---

## Desde Windows — Acceso al Panel

```powershell
# Si usas SSH key
ssh -i clave-privada ubuntu@IP_SERVIDOR

# Panel Dokploy accesible desde navegador
# Solo necesitas la IP pública del servidor
Start-Process "https://IP_SERVIDOR"
```

---

## Troubleshooting

| Problema | Solución |
|----------|----------|
| Build falla | Revisar logs en Dokploy → App → Logs |
| No conecta a BD | Verificar SUPABASE_URL en variables |
| SSL no funciona | Forzar: Dokploy → Settings → Force SSL |
| Servidor lento | Ver recursos: Dokploy → Server → Resources |
| Deploy no inicia | Revisar rama en GitHub conectada |

---

## Costos

| Servidor | Costo |
|----------|-------|
| Oracle Free Tier | $0/mes (4 vCPU, 24GB RAM) |
| GCP e2-medium | ~$15/mes |
| Alibaba ecs.t6 | ~$3-5/mes |

---

## Output

After setting up:
- [ ] Panel Dokploy accesible
- [ ] 1-3 servidores configurados según necesidad
- [ ] Aplicación deployada al servidor correcto
- [ ] Variables de entorno configuradas
- [ ] Dominio (si aplica)
- [ ] RUNBOOK.md actualizado con panel de este cliente
