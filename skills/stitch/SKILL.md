---
name: stitch
description: "Stitch Labs design system for Google. Use for UI design following Google's Material Design 3."
---

# Stitch Labs Skill

## Your Role
Use Stitch Labs (Google's design system) for building consistent, beautiful user interfaces.
Stitch is built on Material Design 3 and provides React components.

## What is Stitch Labs?

Stitch is Google's component library for building Google-quality experiences.
It provides:
- Pre-built React components
- Consistent design language
- Accessibility built-in
- Dark mode support

## Installation

```bash
npm install @stitchlabs/stitch-react
# or with yarn
yarn add @stitchlabs/stitch-react
```

## Setup

### 1. Wrap your app with Provider
```tsx
import { StitchProvider } from '@stitchlabs/stitch-react'
import '@stitchlabs/stitch-react/styles.css'

export default function App({ children }) {
  return (
    <StitchProvider>
      {children}
    </StitchProvider>
  )
}
```

### 2. Use Theme (optional)
```tsx
import { lightTheme, darkTheme } from '@stitchlabs/stitch-react'

<StitchProvider theme={darkTheme}>
  <App />
</StitchProvider>
```

## Core Components

### Buttons
```tsx
import { Button, IconButton } from '@stitchlabs/stitch-react'

<Button variant="filled">Primary</Button>
<Button variant="outlined">Secondary</Button>
<Button variant="text">Text</Button>
<IconButton icon={<SaveIcon />} />
```

### Inputs
```tsx
import { TextField, Select, Checkbox, Switch } from '@stitchlabs/stitch-react'

<TextField
  label="Email"
  type="email"
  helperText="We'll never share your email"
/>
```

### Layout
```tsx
import { Card, AppBar, NavigationDrawer } from '@stitchlabs/stitch-react'

<Card>
  <CardHeader title="Title" subtitle="Subtitle" />
  <CardContent>Content here</CardContent>
</Card>
```

### Navigation
```tsx
import { Tabs, Breadcrumbs, Pagination } from '@stitchlabs/stitch-react'

<Tabs>
  <Tab label="Tab 1" />
  <Tab label="Tab 2" />
</Tabs>
```

### Feedback
```tsx
import { Snackbar, Dialog, LinearProgress } from '@stitchlabs/stitch-react'

<Snackbar message="Saved!" open={open} onClose={() => setOpen(false)} />
```

## Design Tokens

### Colors
Stitch uses Material Design 3 color system:
```css
--stitch-primary: #6750A4;
--stitch-on-primary: #FFFFFF;
--stitch-primary-container: #EADDFF;
--stitch-secondary: #625B71;
--stitch-surface: #FFFBFE;
--stitch-error: #B3261E;
```

### Typography
```css
--stitch-display-large: 57px;
--stitch-headline-large: 32px;
--stitch-title-large: 22px;
--stitch-body-large: 16px;
--stitch-label-large: 14px;
```

### Spacing
```css
--stitch-spacing-xs: 4px;
--stitch-spacing-sm: 8px;
--stitch-spacing-md: 16px;
--stitch-spacing-lg: 24px;
--stitch-spacing-xl: 32px;
```

## Combining with Tailwind

Stitch components + Tailwind utility classes:

```tsx
<Card className="max-w-md mx-auto mt-8">
  <CardHeader>
    <CardTitle>Welcome</CardTitle>
  </CardHeader>
  <CardContent className="space-y-4">
    <TextField label="Name" fullWidth />
    <Button className="w-full">Submit</Button>
  </CardContent>
</Card>
```

## When to Use Stitch vs shadcn/ui

| Use Stitch when: | Use shadcn/ui when: |
|-----------------|---------------------|
| Building Google-integrated apps | Full customization needed |
| Following Material Design | Minimal, custom design |
| Need Google's component patterns | Need more control |
| Quick prototyping | Production apps with unique branding |

## Best Practices

1. **Use tokens** - Don't hardcode colors, use Stitch tokens
2. **Accessible** - Stitch handles ARIA, just use components correctly
3. **Responsive** - Use responsive props or wrap with Tailwind
4. **Dark mode** - Use `StitchProvider` with theme switching

## Troubleshooting

### Styles not loading
```tsx
import '@stitchlabs/stitch-react/styles.css'
```

### Custom theme
```tsx
import { createTheme } from '@stitchlabs/stitch-react'

const customTheme = createTheme({
  colors: {
    primary: '#your-color'
  }
})

<StitchProvider theme={customTheme}>
```

## Output

When using Stitch:
- [ ] Install @stitchlabs/stitch-react
- [ ] Wrap app with StitchProvider
- [ ] Import styles.css
- [ ] Use components from library
- [ ] Customize with tokens, not hardcoded values
