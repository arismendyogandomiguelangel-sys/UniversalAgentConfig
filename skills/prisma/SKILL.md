---
name: prisma
description: "Prisma ORM integration for Supabase. Use for database modeling, migrations, and queries with type safety."
---

# Prisma Skill

## Your Role
Use this skill when working with Prisma ORM and Supabase database.
Handles schema design, migrations, and type-safe database queries.

## Prerequisites

### Supabase Connection
```env
# .env
DATABASE_URL="postgresql://postgres:[password]@db.[project-ref].supabase.co:5432/postgres"
```

### Install Prisma
```bash
npm install prisma @prisma/client
npx prisma init
```

## Schema Design

### Basic Schema Example
```prisma
// prisma/schema.prisma
generator client {
  provider = "prisma-client-js"
}

datasource db {
  provider = "postgresql"
  url      = env("DATABASE_URL")
}

model User {
  id        String   @id @default(cuid())
  email     String   @unique
  name      String?
  createdAt DateTime @default(now())
  updatedAt DateTime @updatedAt

  posts     Post[]
}

model Post {
  id        String   @id @default(cuid())
  title     String
  content   String?
  published Boolean  @default(false)
  authorId  String
  author    User     @relation(fields: [authorId], references: [id])
  createdAt DateTime @default(now())
}
```

## Common Commands

### Development
```bash
# Create migration
npx prisma migrate dev --name init

# Reset database (dev only)
npx prisma migrate reset

# Generate Prisma Client
npx prisma generate

# View database in browser
npx prisma studio
```

### Production
```bash
# Apply migrations
npx prisma migrate deploy

# Create production migration
npx prisma migrate dev --name add_users_table --create-only
```

## Type-Safe Queries

### Basic CRUD
```typescript
import { PrismaClient } from '@prisma/client'

const prisma = new PrismaClient()

// Create
const user = await prisma.user.create({
  data: { email: 'test@example.com', name: 'Test' }
})

// Read
const users = await prisma.user.findMany()

// Update
const updated = await prisma.user.update({
  where: { id: user.id },
  data: { name: 'Updated' }
})

// Delete
await prisma.user.delete({ where: { id: user.id } })
```

### Relations
```typescript
// Include relations
const userWithPosts = await prisma.user.findUnique({
  where: { id: userId },
  include: { posts: true }
})

// Create with relations
const post = await prisma.post.create({
  data: {
    title: 'New Post',
    author: { connect: { id: userId } }
  }
})
```

## Supabase RLS Integration

Prisma doesn't enforce RLS - handle it at Supabase level:
```sql
-- Enable RLS
ALTER TABLE users ENABLE ROW LEVEL SECURITY;

-- Create policy
CREATE POLICY "Users can view own profile"
  ON users FOR SELECT
  USING (auth.uid() = id);
```

## Checklist

- [ ] Database URL configured in .env
- [ ] Schema designed in prisma/schema.prisma
- [ ] Migration created with `prisma migrate dev`
- [ ] Prisma Client generated
- [ ] RLS policies configured in Supabase
- [ ] Types checked with `npx prisma validate`
