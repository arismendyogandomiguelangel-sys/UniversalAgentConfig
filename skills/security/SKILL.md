---
name: security
description: "Security best practices for the project. Snyk vulnerability scanning, error handling, and security checklist."
---

# Security Skill

## Your Role
Implement and maintain security practices for the project.
Use Snyk for vulnerability scanning and follow security best practices.

## Snyk Integration

### GitHub Actions (already in ci.yml)
```yaml
- name: Snyk security scan
  uses: snyk/actions/node@master
  env:
    SNYK_TOKEN: ${{ secrets.SNYK_TOKEN }}
  with:
    args: --severity-threshold=high
```

### Local Pre-Commit
```bash
# Install Snyk
npm install -D snyk

# Test before commit
npx snyk test

# Monitor for new vulnerabilities
npx snyk monitor
```

## Security Checklist

### Environment Variables
- [ ] Never hardcode secrets in code
- [ ] Use `.env.local` for local development
- [ ] Add `.env*` to `.gitignore`
- [ ] Document all required vars in `.env.example`

### Authentication
- [ ] All API routes have auth checks
- [ ] Supabase RLS enabled on all tables
- [ ] JWT tokens handled securely
- [ ] Passwords hashed (use Supabase Auth)

### Data Protection
- [ ] No sensitive data in logs
- [ ] API responses don't leak internal data
- [ ] File uploads validated and sanitized
- [ ] SQL queries use parameterized statements

### Error Handling
- [ ] Custom error pages (don't expose stack traces)
- [ ] Error boundaries in React
- [ ] Sensitive errors logged, generic messages shown to users

## Supabase RLS Policies

```sql
-- Enable RLS
ALTER TABLE users ENABLE ROW LEVEL SECURITY;

-- Policy: users can read own data
CREATE POLICY "Users can view own profile"
  ON users FOR SELECT
  USING (auth.uid() = id);

-- Policy: users can insert own data
CREATE POLICY "Users can create profile"
  ON users FOR INSERT
  WITH CHECK (auth.uid() = id);

-- Policy: users can update own data
CREATE POLICY "Users can update own profile"
  ON users FOR UPDATE
  USING (auth.uid() = id);
```

## Common Vulnerabilities

| Issue | Prevention |
|-------|------------|
| XSS | Sanitize user input, use React's auto-escaping |
| CSRF | Use Supabase's built-in protection |
| SQL Injection | Use Prisma's parameterized queries |
| Secrets in code | Use environment variables |
| Weak auth | Use Supabase Auth (handled by them) |

## Output

After implementing security:
- [ ] Snyk integrated in CI
- [ ] `.env.example` documented
- [ ] RLS policies on all tables
- [ ] Error boundaries in place
