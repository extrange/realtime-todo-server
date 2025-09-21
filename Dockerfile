FROM node:23@sha256:9a25b5a6f9a90218b73a62205f111e71de5e4289aee952b4dd7e86f7498f2544 AS base

#-------------------------

FROM base

WORKDIR /workspace

COPY . .

RUN npm ci

CMD ["npm", "run", "start"]