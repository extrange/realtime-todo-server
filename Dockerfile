FROM node:23@sha256:7e2a917a7631c4290788781adc88166ea589c97b6da9d016c8e154df6fc6721b AS base

#-------------------------

FROM base

WORKDIR /workspace

COPY . .

RUN npm ci

CMD ["npm", "run", "start"]