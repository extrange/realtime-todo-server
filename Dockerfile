FROM node:24@sha256:64af3819f9275802414d7cdc38c27e9d82bd564dec4d4da87d008255d36c63b4 AS base

#-------------------------

FROM base

WORKDIR /workspace

COPY package.json package-lock.json /workspace/

RUN npm ci

COPY . .

CMD ["npm", "run", "start"]