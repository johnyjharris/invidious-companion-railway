FROM denoland/deno:2.1.4

WORKDIR /app

# Copy all files
COPY . .

# Cache dependencies
RUN deno install --entrypoint src/main.ts

# Expose port
EXPOSE 3000

# Set production environment
ENV DENO_ENV=production

# Run the application
CMD ["deno", "task", "start"]
