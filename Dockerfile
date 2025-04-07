FROM node:23@sha256:047d633b358c33f900110efff70b4f1c73d066dec92dd6941c42d26889f69a0e AS base

#-------------------------

FROM base

WORKDIR /workspace

COPY . .

RUN npm ci

CMD ["npm", "run", "start"]