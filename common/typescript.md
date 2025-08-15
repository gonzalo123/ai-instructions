# TypeScript Requirements

## Target Version
- **TypeScript 5.0+** with latest ECMAScript target
- **Node.js 18+** for runtime environment
- All code, comments, and documentation MUST be in English

## Core Language Features
- **Strict Mode**: Always use `"strict": true` in tsconfig.json
- **Type Safety**: Leverage TypeScript's type system to its fullest
- **Modern Syntax**: Use ES2022+ features with proper transpilation

### Essential TypeScript Features
```typescript
// Type definitions
interface User {
  readonly id: string;
  name: string;
  email?: string;
  roles: readonly Role[];
}

type UserAction = 'create' | 'update' | 'delete';

// Generic constraints
function processItems<T extends Record<string, unknown>>(items: T[]): T[] {
  return items.filter(item => Object.keys(item).length > 0);
}

// Utility types
type PartialUser = Partial<User>;
type RequiredUser = Required<User>;
type UserKeys = keyof User;
```

## Code Style & Standards
- **ESLint + Prettier**: Use `@typescript-eslint/eslint-plugin` with strict rules
- **Import Organization**: Use `@typescript-eslint/consistent-type-imports`
- **Naming Conventions**:
  - PascalCase for types, interfaces, classes, enums
  - camelCase for variables, functions, methods
  - SCREAMING_SNAKE_CASE for constants
  - kebab-case for file names

## Advanced Type Patterns
- **Discriminated Unions**: For state management and API responses
- **Branded Types**: For type-safe IDs and values
- **Template Literal Types**: For string pattern validation
- **Conditional Types**: For complex type transformations

```typescript
// Discriminated union example
type ApiResponse<T> = 
  | { status: 'success'; data: T }
  | { status: 'error'; error: string };

// Branded type example
type UserId = string & { readonly brand: unique symbol };
```

## Project Configuration
### tsconfig.json essentials
```json
{
  "compilerOptions": {
    "target": "ES2022",
    "module": "ESNext",
    "moduleResolution": "bundler",
    "strict": true,
    "exactOptionalPropertyTypes": true,
    "noUncheckedIndexedAccess": true,
    "noImplicitReturns": true,
    "noFallthroughCasesInSwitch": true,
    "noImplicitOverride": true
  }
}
```

## Testing & Quality
- **Vitest** or **Jest** for unit testing with TypeScript support
- **Type-only imports** for test types: `import type { Mock } from 'vitest'`
- **MSW (Mock Service Worker)** for API mocking
- **Test coverage**: Maintain >90% with type coverage checking

## Error Handling
- **Result/Either Pattern**: For functional error handling
- **Custom Error Classes**: With proper inheritance and type guards
- **Async Error Boundaries**: For React/framework error handling

```typescript
type Result<T, E = Error> = 
  | { success: true; data: T }
  | { success: false; error: E };

class ValidationError extends Error {
  constructor(
    message: string,
    public readonly field: string
  ) {
    super(message);
    this.name = 'ValidationError';
  }
}
```

## Performance & Optimization
- **Tree Shaking**: Structure imports for optimal bundling
- **Dynamic Imports**: Use for code splitting
- **Type-only Imports**: Use `import type` when possible
- **Bundle Analysis**: Regular bundle size monitoring

## Security Considerations
- **Input Validation**: Use Zod or similar for runtime type checking
- **Type Guards**: For safe type narrowing
- **Sanitization**: Always sanitize user inputs with proper typing
- **Environment Variables**: Use typed environment configuration

```typescript
import { z } from 'zod';

const UserSchema = z.object({
  id: z.string().uuid(),
  email: z.string().email(),
  age: z.number().min(0).max(150)
});

type User = z.infer<typeof UserSchema>;
```
