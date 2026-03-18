---
name: api-testing
description: "Bruno API testing. Use for testing REST APIs with version-controllable collections."
---

# API Testing Skill (Bruno)

## Your Role
Use Bruno for API testing instead of Postman. Bruno collections are plain text files that can be version-controlled in git.

## Installation

```bash
# macOS
brew install bruno

# Windows
choco install bruno

# npm
npm install -g bruno
```

## Project Structure

```
api-tests/
├── README.md
├── collection.bru
└── environments/
    ├── local.bru
    └── production.bru
```

## Creating a Collection

```bash
mkdir api-tests
cd api-tests
bruno init
```

## Example: Test Supabase Auth

### collection.bru
```
meta {
  name: auth-tests
  type: folder
}

GET auth/user
url: {{baseUrl}}/auth/v1/user
headers:
  Authorization: Bearer {{token}}

---

POST auth/signup
url: {{baseUrl}}/auth/v1/signup
body:
  json:
    email: test@example.com
    password: password123

---

POST auth/login
url: {{baseUrl}}/auth/v1/token?grant_type=password
body:
  json:
    email: test@example.com
    password: password123
```

### environments/local.bru
```
vars {
  baseUrl: http://localhost:3000
  token:
}
```

### environments/production.bru
```
vars {
  baseUrl: https://api.production.com
  token:
}
```

## Running Tests

```bash
# Run all tests
bruno test api-tests

# Run specific collection
bruno test api-tests/auth

# Run with environment
bruno test api-tests --env production
```

## CI Integration

```yaml
# .github/workflows/api-tests.yml
name: API Tests

on: [push, pull_request]

jobs:
  test:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - name: Install Bruno
        run: npm install -g bruno
      - name: Run API tests
        run: bruno test api-tests --env local
```

## Best Practices

1. **Version control** - Keep collections in `api-tests/`
2. **Environment files** - Use local/production/ci environments
3. **Descriptive names** - Name requests clearly
4. **Assertions** - Test response status, body, headers
5. **Scripts** - Use pre/post scripts for setup/teardown

## Example with Assertions

```javascript
// POST /auth/login - post script
if (res.status === 200) {
  const token = res.body.access_token;
  bru.setEnvVar("token", token);
}

// GET /user - test
test("Should return user profile", function() {
  expect(res.status).toBe(200);
  expect(res.body.email).toBe("test@example.com");
});
```

## Output

- [ ] `api-tests/` folder created
- [ ] Collections for each API endpoint
- [ ] Environment files (local, production)
- [ ] Tests run in CI pipeline
