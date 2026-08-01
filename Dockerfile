FROM node:24@sha256:19cd848a0e073d34bd8cd5545a1b6b4d28489b3e3b607366621ced442bd5f6b4 AS base

#-------------------------

FROM base

WORKDIR /workspace

COPY package.json package-lock.json /workspace/

RUN npm ci

COPY . .

CMD ["npm", "run", "start"]