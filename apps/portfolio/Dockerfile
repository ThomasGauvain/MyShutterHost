# ============================================================
# Portfolio App — Production Dockerfile
# Used by Coolify to build and deploy to Vultr
# ============================================================

FROM node:20-alpine AS base
RUN apk add --no-cache libc6-compat
RUN npm install -g pnpm@9

FROM base AS deps
WORKDIR /app
COPY package.json pnpm-workspace.yaml turbo.json ./
COPY packages/db/package.json ./packages/db/
COPY packages/ui/package.json ./packages/ui/
COPY packages/types/package.json ./packages/types/
COPY packages/config/package.json ./packages/config/
COPY apps/portfolio/package.json ./apps/portfolio/
RUN pnpm install --frozen-lockfile

FROM base AS builder
WORKDIR /app
COPY --from=deps /app/node_modules ./node_modules
COPY --from=deps /app/packages ./packages
COPY . .
RUN pnpm --filter @myshutterhost/db exec prisma generate
ENV NEXT_TELEMETRY_DISABLED=1
RUN pnpm turbo build --filter=@myshutterhost/portfolio

FROM base AS runner
WORKDIR /app
ENV NODE_ENV=production
ENV NEXT_TELEMETRY_DISABLED=1
RUN addgroup --system --gid 1001 nodejs
RUN adduser --system --uid 1001 nextjs
COPY --from=builder /app/apps/portfolio/public ./apps/portfolio/public
COPY --from=builder --chown=nextjs:nodejs /app/apps/portfolio/.next/standalone ./
COPY --from=builder --chown=nextjs:nodejs /app/apps/portfolio/.next/static ./apps/portfolio/.next/static
USER nextjs
EXPOSE 3002
ENV PORT=3002
ENV HOSTNAME="0.0.0.0"
CMD ["node", "apps/portfolio/server.js"]
