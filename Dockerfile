FROM node:24@sha256:8530f76a96d88820d288761f022e318970dda93d01536919fbc16076b7983e63 AS base

#-------------------------

FROM base

WORKDIR /workspace

COPY package.json package-lock.json /workspace/

RUN npm ci

COPY . .

CMD ["npm", "run", "start"]