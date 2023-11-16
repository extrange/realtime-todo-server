FROM node:20

WORKDIR /workspace

COPY . .

RUN npm ci

CMD ["npm", "run", "start"]