# MyShutterHost — Developer Workflow Guide

## The Full Picture

```
Your Laptop                    GitHub                  Vultr / Coolify (Live)
───────────────                ──────                  ──────────────────────
Work on develop  ──push──▶  develop branch   (no auto-deploy — staging only)
Test locally                                
Happy with it?   ──push──▶  main branch  ──▶  Coolify webhook fires
                                              Only changed apps rebuild
                                              Live site updated in ~2 min
```

---

## First-Time Setup (Do This Once)

### Step 1 — Install Prerequisites
- [Docker Desktop](https://www.docker.com/products/docker-desktop/) (for local database)
- [Node.js 20+](https://nodejs.org)
- [pnpm](https://pnpm.io): `npm install -g pnpm@9`

### Step 2 — Clone the repo
```bash
git clone https://github.com/ThomasGauvain/MyShutterHost.git
cd MyShutterHost
```

### Step 3 — Set up local environment variables
```bash
# Copy the local env template
cp .env.local.example .env.local

# The defaults work out of the box for local dev.
# Add your Stripe test keys and other API keys as needed.
```

### Step 4 — Start the local database
```bash
docker compose up -d
```
This starts:
- **PostgreSQL** at `localhost:5432`
- **Redis** at `localhost:6379`  
- **pgAdmin** (database GUI) at `http://localhost:5050`

### Step 5 — Install dependencies
```bash
pnpm install
```

### Step 6 — Set up the database schema
```bash
pnpm --filter @myshutterhost/db run db:migrate
```
This creates all the tables in your local PostgreSQL.

### Step 7 — Start the dev server
```bash
pnpm dev
```
This starts ALL apps simultaneously:
- **Dashboard**: http://localhost:3000
- **Marketing**: http://localhost:3001
- **Portfolio**: http://localhost:3002

---

## Daily Development Workflow

### Working on a feature
```bash
# Always work on the develop branch locally
git checkout develop

# Make your changes to any app or package
# The dev server hot-reloads automatically — no restart needed

# When done with a chunk of work, commit
git add .
git commit -m "feat(dashboard): add gallery upload section"

# Push to develop (does NOT go to live server)
git push origin develop
```

### Pushing to the live server
```bash
# When you're happy and tested locally:
git checkout main
git merge develop
git push origin main   # ← This triggers Coolify to deploy

# Switch back to develop to keep working
git checkout develop
```

### Only deploying ONE app (not all three)
Coolify is configured per-app. You can trigger a redeploy of just one service:
- Go to Coolify dashboard → select the specific app (e.g. Dashboard)
- Click "Deploy" on just that service
- OR: Coolify detects which Dockerfile changed and only rebuilds that app

---

## Database Changes

When you change the Prisma schema (`packages/db/prisma/schema.prisma`):

```bash
# 1. Create a new migration (local)
pnpm --filter @myshutterhost/db run db:migrate
# Enter a name like: "add_gallery_music_field"
# This creates a migration file in packages/db/prisma/migrations/

# 2. Commit the migration file
git add packages/db/prisma/migrations/
git commit -m "db: add gallery music field migration"

# 3. Push to main → Coolify deploys → runs "prisma migrate deploy" automatically
# The live database schema updates alongside the code
```

> ⚠️ **Never delete migration files.** They are the history of your database changes.

---

## Useful Commands

| Command | What It Does |
|---------|-------------|
| `docker compose up -d` | Start local database + Redis |
| `docker compose down` | Stop local database |
| `docker compose down -v` | ⚠️ Stop AND delete all local data |
| `pnpm dev` | Start all apps in dev mode |
| `pnpm dev --filter=@myshutterhost/dashboard` | Start ONLY the dashboard |
| `pnpm build` | Build all apps (like production) |
| `pnpm build --filter=@myshutterhost/dashboard` | Build ONLY the dashboard |
| `pnpm --filter @myshutterhost/db run db:studio` | Open Prisma Studio (DB GUI) |
| `pnpm --filter @myshutterhost/db run db:migrate` | Create + apply new migration |

---

## How Coolify Knows What Changed (Turborepo)

Turborepo compares your latest commit to the previous one and skips apps that didn't change:

```
Example: You only changed apps/dashboard/
  ✅ dashboard → rebuilds and redeploys (~90 seconds)
  ⏭️ portfolio → skipped (cached, instant)
  ⏭️ marketing → skipped (cached, instant)
```

This means pushing to main is fast — only what you touched gets rebuilt.

---

## Coolify Setup (One-Time on the Server)

In Coolify, create 5 separate services from this GitHub repo:

| Service Name | Dockerfile Path | Port | Auto-Deploy Branch |
|---|---|---|---|
| `msh-dashboard` | `apps/dashboard/Dockerfile` | 3000 | `main` |
| `msh-portfolio` | `apps/portfolio/Dockerfile` | 3002 | `main` |
| `msh-marketing` | `apps/marketing/Dockerfile` | 3001 | `main` |
| `msh-postgres` | PostgreSQL (built-in) | 5432 | — |
| `msh-redis` | Redis (built-in) | 6379 | — |

Set the GitHub webhook in Coolify → each push to `main` triggers only the services whose Dockerfile context changed.

---

## pgAdmin — Browsing Your Local Database

Visit http://localhost:5050 after starting Docker.

Login: `admin@myshutterhost.local` / `admin`

Add a server connection:
- Host: `postgres` (the Docker service name)
- Port: `5432`
- Username: `myshutterhost`
- Password: `localdevpassword`
- Database: `myshutterhost`
