FROM node:23@sha256:79daa9914f64d084477d704b32ab6143190d21c43b4f4ae5410bac7a491e07ae AS base

#-------------------------

FROM base

WORKDIR /workspace

COPY . .

RUN npm ci

CMD ["npm", "run", "start"]