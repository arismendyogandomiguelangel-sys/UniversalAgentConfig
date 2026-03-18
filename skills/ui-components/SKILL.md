---
name: ui-components
description: "UI component library. Use for building user interfaces with pre-built, customizable components."
---

# UI Components Skill

## Your Role
Build user interfaces using component libraries. This skill covers shadcn/ui (recommended base) and additional UI patterns.

## Recommended Stack

### Primary: shadcn/ui + Tailwind CSS
- Built on Radix UI primitives
- Fully customizable
- Copy/paste components (not npm dependency)
- TypeScript by default

### Installation

```bash
# Install Tailwind CSS
npx tailwindcss init -p

# Install shadcn/ui
npx shadcn-ui@latest init

# Add components
npx shadcn-ui@latest add button
npx shadcn-ui@latest add dialog
npx shadcn-ui@latest add dropdown-menu
```

## Component Categories

### Layout
- Container, Stack, Grid
- Card, Section
- Sidebar, Header, Footer

### Forms
- Input, Textarea, Select
- Checkbox, Radio, Switch
- Form (with React Hook Form + Zod)
- Button (primary, secondary, ghost, link)

### Data Display
- Table (with sorting, pagination)
- Badge, Tag
- Avatar
- Skeleton (loading state)

### Feedback
- Alert, Toast (Sonner)
- Dialog, Modal
- Dropdown Menu
- Popover, Tooltip

### Navigation
- Tabs, Accordion
- Breadcrumb
- Pagination
- Command (cmd+k palette)

## Usage Example

```tsx
import { Button } from "@/components/ui/button"
import { Card, CardHeader, CardTitle, CardContent } from "@/components/ui/card"
import { Input } from "@/components/ui/input"

export function UserProfile() {
  return (
    <Card>
      <CardHeader>
        <CardTitle>Profile</CardTitle>
      </CardHeader>
      <CardContent>
        <div className="space-y-4">
          <Input placeholder="Your name" />
          <Button>Save</Button>
        </div>
      </CardContent>
    </Card>
  )
}
```

## Styling with Tailwind

### Configuration (tailwind.config.js)
```javascript
module.exports = {
  darkMode: ["class"],
  content: ["./src/**/*.{ts,tsx}"],
  theme: {
    extend: {
      colors: {
        border: "hsl(var(--border))",
        background: "hsl(var(--background))",
        foreground: "hsl(var(--foreground))",
        primary: {
          DEFAULT: "hsl(var(--primary))",
          foreground: "hsl(var(--primary-foreground))",
        },
      },
    },
  },
}
```

### CSS Variables (globals.css)
```css
@tailwind base;
@tailwind components;
@tailwind utilities;

@layer base {
  :root {
    --background: 0 0% 100%;
    --foreground: 222.2 84% 4.9%;
    --primary: 221.2 83.2% 53.3%;
    --primary-foreground: 210 40% 98%;
    --border: 214.3 31.8% 91.4%;
  }

  .dark {
    --background: 222.2 84% 4.9%;
    --foreground: 210 40% 98%;
  }
}
```

## Optional: gridstack.js

For drag-and-drop dashboards:
```bash
npm install gridstack
```

```tsx
import { GridStack } from 'gridstack'

// Initialize
const grid = GridStack.init({
  column: 12,
  cellHeight: 100,
  margin: 10
})

// Add widget
grid.addWidget({
  w: 4, h: 2,
  content: 'My Widget'
})
```

## Responsive Patterns

```tsx
// Mobile-first
<div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-4">
  {/* 1 col mobile, 2 tablet, 4 desktop */}
</div>
```

## Accessibility

All shadcn/ui components are accessible by default (Radix UI).
Ensure:
- Keyboard navigation works
- Focus states visible
- ARIA labels where needed
- Color contrast sufficient

## Output

When building UI:
- [ ] Use shadcn/ui as base
- [ ] Tailwind for custom styling
- [ ] Follow design system tokens
- [ ] Mobile-first responsive
- [ ] Accessible (keyboard, ARIA)
