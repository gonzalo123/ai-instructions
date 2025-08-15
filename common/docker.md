## Docker
### Dockerfile Best Practices
Multi-stage Builds: Always use multi-stage builds to create lean, production-ready images. The final stage should only contain the application runtime and necessary files.
Minimize Image Size: Prioritize minimizing the final image size. This includes using smaller base images (like Alpine) when appropriate, cleaning up package caches after installation, and reducing unnecessary layers.
Secure by Default:
- Avoid running as the root user. Switch to a non-privileged user with the USER instruction.
- Use COPY --chown to set the correct ownership of files.
- Never expose sensitive information like passwords or API keys directly in the Dockerfile. Use build arguments (ARG) and environment variables (ENV) instead.

### Docker Compose for Development
Orchestration: Use docker-compose.yml for orchestrating multi-container applications during development. This includes defining services, networks, and volumes.
Environment Management: Use .env files and the env_file directive in docker-compose.yml to manage environment variables. This keeps sensitive data separate from the main configuration.
Volumes: Employ named volumes or bind mounts to persist data and enable live reloading during development. Clearly explain the purpose of each volume.
Service Dependencies: Define service dependencies and startup order using depends_on.

### Container-Native Application Design
Stateless Containers: Design applications to be stateless. Any persistent data should be stored in volumes or external services (e.g., databases).
Graceful Shutdowns: Ensure applications can handle graceful shutdowns when a SIGTERM signal is received from Docker, allowing them to clean up resources before exiting.
Resource Limits: When discussing production deployments, suggest appropriate resource limits (limits and reservations) for CPU and memory to prevent resource starvation on the host machine.