FROM denoland/deno:2.1.4

WORKDIR /app

# Copy dependency files
COPY deno.json deno.lock ./

# Cache dependencies
RUN deno install --entrypoint deno.json

# Copy source code
COPY . .

# Expose port
EXPOSE 3000

# Set production environment
ENV DENO_ENV=production

# Run the application
CMD ["deno", "task", "start"]
