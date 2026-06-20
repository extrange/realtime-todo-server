FROM node:24@sha256:032e78d7e54e352129831743737e3a83171d9cc5b5896f411649c597ce0b11ea AS base

#-------------------------

FROM base

WORKDIR /workspace

COPY package.json package-lock.json /workspace/

RUN npm ci

COPY . .

CMD ["npm", "run", "start"]