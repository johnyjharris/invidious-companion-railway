# Invidious Companion - Railway Deployment

A Docker-based deployment configuration for [Invidious Companion](https://github.com/iv-org/invidious-companion) optimized for [Railway](https://railway.app).

## Overview

Invidious Companion is a service that handles video stream retrieval from YouTube servers for Invidious instances. This repository provides a Railway-optimized Docker deployment configuration.

## Prerequisites

- Railway account ([sign up here](https://railway.app))
- Basic understanding of environment variables and Docker

## Quick Deploy to Railway

[![Deploy on Railway](https://railway.app/button.svg)](https://railway.app/new/template)

## Manual Deployment

### 1. Clone this Repository

```bash
git clone https://github.com/YOUR_USERNAME/invidious-companion-railway.git
cd invidious-companion-railway
```

### 2. Set Up Railway Project

```bash
# Install Railway CLI (if not already installed)
npm i -g @railway/cli

# Login to Railway
railway login

# Initialize new project
railway init

# Link to your project
railway link
```

### 3. Configure Environment Variables

Set the following environment variable in Railway:

```bash
railway variables set SERVER_SECRET_KEY=your_secure_random_key_here
```

**Important:**
- Generate a strong, unique secret key (recommended: 32+ random characters)
- Do NOT use the same key as your Invidious instance's HMAC_KEY
- Keep this key secure and never commit it to version control

### 4. Deploy

```bash
railway up
```

## Environment Variables

| Variable | Required | Description |
|----------|----------|-------------|
| `SERVER_SECRET_KEY` | Yes | Secret key for the companion server. Must be unique and secure. |
| `PORT` | No | Port to run the server on (Railway sets this automatically) |

## Configuration

The companion service will be automatically available at your Railway-provided URL (e.g., `your-app.railway.app`).

To connect it to your Invidious instance, update your Invidious configuration:

```yaml
# In your Invidious docker-compose.yml or config.yml
companion_url: "https://your-companion-url.railway.app"
```

## Development

### Local Development

1. Clone the official Invidious Companion repository:
```bash
git clone https://github.com/iv-org/invidious-companion.git
cd invidious-companion
```

2. Install [Deno](https://docs.deno.com/runtime/)

3. Run in development mode:
```bash
SERVER_SECRET_KEY=CHANGEME deno task dev
```

## Architecture

- **Runtime:** Deno 2.1.4
- **Base Image:** denoland/deno:2.1.4
- **Port:** 3000 (configurable via Railway)
- **Restart Policy:** On failure (max 10 retries)

## Documentation

- [Invidious Companion GitHub](https://github.com/iv-org/invidious-companion)
- [Invidious Documentation](https://docs.invidious.io)
- [Railway Documentation](https://docs.railway.app)

## Security Considerations

1. **Secret Key Management:**
   - Always use a unique, randomly generated `SERVER_SECRET_KEY`
   - Never reuse keys between services
   - Use Railway's environment variable encryption

2. **HTTPS:**
   - Railway provides automatic HTTPS certificates
   - Always use HTTPS URLs when configuring your Invidious instance

3. **Updates:**
   - Regularly update the Deno base image version
   - Monitor the upstream Invidious Companion repository for security updates

## Troubleshooting

### Service Won't Start

1. Check Railway logs: `railway logs`
2. Verify `SERVER_SECRET_KEY` is set
3. Ensure Dockerfile and deno.json are properly configured

### Connection Issues

1. Verify the Railway-provided URL is accessible
2. Check that your Invidious instance can reach the companion URL
3. Confirm firewall/network settings allow outbound HTTPS

## License

This deployment configuration is provided as-is. The Invidious Companion project is licensed under AGPL-3.0.

## Contributing

Issues and pull requests are welcome! Please ensure:

1. Docker builds successfully
2. Environment variables are properly documented
3. Railway deployment works as expected

## Support

- [Invidious Companion Issues](https://github.com/iv-org/invidious-companion/issues)
- [Railway Community](https://help.railway.app)
