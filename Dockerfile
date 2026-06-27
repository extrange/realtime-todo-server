FROM node:24@sha256:fdddfb3e688158251943d52eba361de991548f6814007acba4917ae6b512d6be AS base

#-------------------------

FROM base

WORKDIR /workspace

COPY package.json package-lock.json /workspace/

RUN npm ci

COPY . .

CMD ["npm", "run", "start"]