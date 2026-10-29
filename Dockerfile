FROM node:24@sha256:6449e19d8184d84062525b6a7524def03146c2cb04a7f08b076680d0e8e4240a AS base

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
