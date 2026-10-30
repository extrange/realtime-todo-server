FROM node:26@sha256:6d2c7d5d074bf72f81ddc252b4fbb5d625bc028eeda49cb4b8c2ff8eda1ee617 AS base

WORKDIR /workspace

#-------------------------

FROM base AS build

COPY package.json package-lock.json ./

RUN npm ci --no-audit --no-fund

COPY tsconfig.json ./
COPY src ./src

RUN npm run build

#-------------------------

FROM base AS runtime

ENV NODE_ENV=production
ENV DATABASE_PATH=/data/db.sqlite

COPY package.json package-lock.json ./

RUN npm ci --omit=dev --no-audit --no-fund \
    && npm cache clean --force

COPY --from=build /workspace/dist ./dist

RUN mkdir -p /data

EXPOSE 1234

HEALTHCHECK --interval=30s --timeout=5s --start-period=10s --retries=3 \
    CMD node -e "fetch('http://127.0.0.1:' + (process.env.PORT ?? 1234)).then((response) => process.exit(response.ok ? 0 : 1)).catch(() => process.exit(1))"

CMD ["node", "--enable-source-maps", "dist/main.js"]
