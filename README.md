# MyShutterHost

A professional SaaS photography hosting platform — think Zenfolio + SmugMug + Pixieset, but more powerful and fully your own.

## 🏗️ Two Products in One Platform

| Product | Description |
|---------|-------------|
| **MyShutterHost.com** | The platform's own marketing/support website |
| **Photographer Sites** | What subscribers get — their own hosted portfolio website |

## 🛠️ Tech Stack

| Layer | Choice |
|-------|--------|
| **Framework** | Next.js 16 (App Router, TypeScript) |
| **Styling** | Tailwind CSS + shadcn/ui |
| **Monorepo** | Turborepo + pnpm |
| **Database** | PostgreSQL (Docker via Coolify) |
| **ORM** | Prisma |
| **Auth** | Auth.js v5 |
| **Storage** | Cloudflare R2 |
| **CDN / DNS** | Cloudflare |
| **Hosting** | Vultr VPS + Coolify |
| **Payments** | Stripe |
| **Email** | Resend |
| **Real-time** | Socket.io |
| **Animations** | GSAP + ScrollTrigger + Lenis |
| **Mobile** | React Native + Expo (Phase 4) |

## 📁 Project Structure

```
MyShutterHost/
├── apps/
│   ├── marketing/     ← MyShutterHost.com (Product 1)
│   ├── dashboard/     ← Photographer's backend admin panel
│   ├── portfolio/     ← Photographer's public-facing website (Product 2)
│   └── mobile/        ← React Native + Expo app (Phase 4)
└── packages/
    ├── ui/            ← Shared design system & components
    ├── db/            ← Prisma schema & database client
    ├── types/         ← Shared TypeScript types
    └── config/        ← ESLint, Tailwind, TypeScript configs
```

## 🚀 Development Phases

### Phase 1 — Core Platform (MVP)
Get photographers live with a website, gallery, and ability to sell.

### Phase 2 — Client & Business Tools
Full business platform: booking, contracts, CRM, invoicing.

### Phase 3 — Power Tools & AI
Lightroom/Photoshop AI plugins, AI style trainer, preset marketplace.

### Phase 4 — Mobile & Scale
React Native app, i18n, advanced scaling.

## 📋 Full Implementation Plan

See [`docs/implementation_plan.md`](docs/implementation_plan.md) for the complete feature plan.

## 🧑‍💻 Getting Started

### Prerequisites
- Node.js 20+
- pnpm 9+
- Docker (for local PostgreSQL + Redis)

### Install
```bash
pnpm install
```

### Development
```bash
pnpm dev
```

### Environment Setup
Copy `.env.example` to `.env.local` in each app and fill in your values.

## 📄 License
Private — All rights reserved.
