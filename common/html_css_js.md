## HTML/CSS Requirements
- **Language**: All comments and documentation MUST be in English
- **HTML**:
- Use HTML5 semantic elements (`<header>`, `<nav>`, `<main>`, `<section>`, `<article>`, `<footer>`, `<search>`, etc.)
- Include appropriate ARIA attributes for accessibility
- Ensure valid markup that passes W3C validation
- Use responsive design practices
- Optimize images using modern formats (`WebP`, `AVIF`)
- Include `loading="lazy"` on images where applicable
- Generate `srcset` and `sizes` attributes for responsive images when relevant
- Prioritize SEO-friendly elements (`<title>`, `<meta description>`, Open Graph tags)

- **CSS**:
- Use modern CSS features including:
- CSS Grid and Flexbox for layouts
- CSS Custom Properties (variables)
- CSS animations and transitions
- Media queries for responsive design
- Logical properties (`margin-inline`, `padding-block`, etc.)
- Modern selectors (`:is()`, `:where()`, `:has()`)
- Follow BEM or similar methodology for class naming
- Use CSS nesting where appropriate
- Include dark mode support with `prefers-color-scheme`
- Prioritize modern, performant fonts and variable fonts for smaller file sizes
- Use modern units (`rem`, `vh`, `vw`) instead of traditional pixels (`px`) for better responsiveness

## JavaScript Requirements
- **Minimum Compatibility**: ECMAScript 2020 (ES11) or higher
- **Language**: All comments, JSDoc, and variable names MUST be in English
- **Features to Use**:
- Arrow functions
- Template literals
- Destructuring assignment
- Spread/rest operators
- Async/await for asynchronous code
- Classes with proper inheritance when OOP is needed
- Object shorthand notation
- Optional chaining (`?.`)
- Nullish coalescing (`??`)
- Dynamic imports
- BigInt for large integers
- `Promise.allSettled()`
- `String.prototype.matchAll()`
- `globalThis` object
- Private class fields and methods
- Export * as namespace syntax
- Array methods (`map`, `filter`, `reduce`, `flatMap`, etc.)
- **Avoid**:
- `var` keyword (use `const` and `let`)
- jQuery or any external libraries
- Callback-based asynchronous patterns when promises can be used
- Internet Explorer compatibility
- Legacy module formats (use ES modules)
- Limit use of `eval()` due to security risks
- **Performance Considerations:**
- Recommend code splitting and dynamic imports for lazy loading
**Error Handling**:
- Use `try-catch` blocks **consistently** for asynchronous and API calls, and handle promise rejections explicitly.
- Differentiate among:
- **Network errors** (e.g., timeouts, server errors, rate-limiting)
- **Functional/business logic errors** (logical missteps, invalid user input, validation failures)
- **Runtime exceptions** (unexpected errors such as null references)
- Provide **user-friendly** error messages (e.g., "Something went wrong. Please try again shortly.") and log more technical details to dev/ops (e.g., via a logging service).
- Consider a central error handler function or global event (e.g., `window.addEventListener('unhandledrejection')`) to consolidate reporting.
- Carefully handle and validate JSON responses, incorrect HTTP status codes, etc.
- **All error messages and console logs in English**

### Accessibility
- Ensure compliance with **WCAG 2.1** AA level minimum, AAA whenever feasible.
- Always suggest:
- Labels for form fields.
- Proper **ARIA** roles and attributes.
- Adequate color contrast.
- Alternative texts (`alt`, `aria-label`) for media elements.
- Semantic HTML for clear structure.
- Tools like **Lighthouse** for audits.

## Security Considerations
- Sanitize all user inputs thoroughly.
- Parameterize database queries.
- Enforce strong Content Security Policies (CSP).
- Use CSRF protection where applicable.
- Ensure secure cookies (`HttpOnly`, `Secure`, `SameSite=Strict`).
- Limit privileges and enforce role-based access control.
- Implement detailed internal logging and monitoring.
- **All security-related comments and logs in English**
- Be sure to consider the following aspects:
  - Code Injection: Check for potential code injection vulnerabilities (SQL, XSS, etc.). Especially not using bind parameters with SQL queries.
  - Handling of Sensitive Data: Ensure that sensitive data is properly protected and cannot be extracted without being logged.
  - Input Validation: Verify that all user inputs are correctly validated.
  - Secure Coding Practices: Observe if secure coding best practices are followed.
  - Code changes do not introduce any security vulnerabilities or bypass security checks

- To conduct the audit service, you will use the following audit criteria:
  - The OWASP testing guide V4 for web services
  - The PTES (The Penetration Testing Execution Standard)
  - The IT hygiene guide from ANSSI (FR cybersecurity agency)