---
name: zustand
description: "Zustand state management for React. Use for global client state with minimal boilerplate."
---

# Zustand Skill

## Your Role
Use this skill when implementing global state management in React applications.
Zustand provides a simple, scalable state management solution.

## Installation

```bash
npm install zustand
```

## Basic Store

```typescript
// stores/useCounterStore.ts
import { create } from 'zustand'

interface CounterState {
  count: number
  increment: () => void
  decrement: () => void
  reset: () => void
}

export const useCounterStore = create<CounterState>((set) => ({
  count: 0,
  increment: () => set((state) => ({ count: state.count + 1 })),
  decrement: () => set((state) => ({ count: state.count - 1 })),
  reset: () => set({ count: 0 })
}))
```

## Usage in Components

```tsx
import { useCounterStore } from '@/stores/useCounterStore'

function Counter() {
  const { count, increment } = useCounterStore()

  return (
    <div>
      <p>Count: {count}</p>
      <button onClick={increment}>Increment</button>
    </div>
  )
}
```

## Advanced Patterns

### With Async Actions

```typescript
interface UserState {
  user: User | null
  isLoading: boolean
  error: string | null
  fetchUser: (id: string) => Promise<void>
}

export const useUserStore = create<UserState>((set) => ({
  user: null,
  isLoading: false,
  error: null,
  fetchUser: async (id) => {
    set({ isLoading: true, error: null })
    try {
      const response = await fetch(`/api/users/${id}`)
      const user = await response.json()
      set({ user, isLoading: false })
    } catch (error) {
      set({ error: error.message, isLoading: false })
    }
  }
}))
```

### With Persistence

```typescript
import { persist, createJSONStorage } from 'zustand/middleware'

interface CartState {
  items: CartItem[]
  addItem: (item: CartItem) => void
  removeItem: (id: string) => void
}

export const useCartStore = create<CartState>()(
  persist(
    (set) => ({
      items: [],
      addItem: (item) => set((state) => ({ items: [...state.items, item] })),
      removeItem: (id) => set((state) => ({ items: state.items.filter(i => i.id !== id) }))
    }),
    {
      name: 'cart-storage',
      storage: createJSONStorage(() => localStorage)
    }
  )
)
```

### Selectors (Performance)

```typescript
// Bad: re-renders on any store change
const { count } = useStore()

// Good: only re-renders when count changes
const count = useStore((state) => state.count)

// Good: subscribe to specific slice
const increment = useStore((state) => state.increment)
```

## Store Organization

```
stores/
├── index.ts          # exports all stores
├── useAuthStore.ts   # authentication state
├── useCartStore.ts   # shopping cart
└── useUIStore.ts    # UI state (modals, sidebar, etc.)
```

## Best Practices

1. **One store per domain** - Don't put everything in one store
2. **Use selectors** - Prevent unnecessary re-renders
3. **Keep it simple** - Zustand is minimal by design
4. **Use TypeScript** - Full type inference available
5. **Persist carefully** - Don't persist sensitive data

## Middleware Available

- `persist` - LocalStorage/SessionStorage persistence
- `devtools` - Redux DevTools integration
- `subscribeWithSelector` - Subscribe to selectors
- `immer` - Immer for mutable updates

```typescript
import { devtools, persist } from 'zustand/middleware'

export const useStore = create(
  devtools(
    persist(
      (set) => ({ ... }),
      { name: 'store-name' }
    )
  )
)
```
