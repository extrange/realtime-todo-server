FROM node:23@sha256:ac6abe7d72fe2a535b331d862bf01e064abfd65c7b085c3ca6a51869014474a0 AS base

#-------------------------

FROM base

WORKDIR /workspace

COPY . .

RUN npm ci

CMD ["npm", "run", "start"]