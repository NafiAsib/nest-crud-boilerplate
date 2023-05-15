# BUILD FOR LOCAL DEVELOPMENT

FROM node:18-alpine As development

WORKDIR /usr/src/app
COPY --chown=node:node package*.json ./
COPY --chown=node:node pnpm-lock.yaml ./

#RUN npm ci
RUN npm i -g pnpm
RUN pnpm i --frozen-lockfile

COPY --chown=node:node . .

USER node

# BUILD FOR PRODUCTION

FROM node:18-alpine As build

WORKDIR /usr/src/app

COPY --chown=node:node package*.json ./

COPY --chown=node:node --from=development /usr/src/app/node_modules ./node_modules

COPY --chown=node:node . .

RUN pnpm run build

ENV NODE_ENV production

# RUN npm ci --only=production && npm cache clean --force
RUN pnpm i --frozen-lockfile --prod && pnpm cache clean --force

USER node

# PRODUCTION

FROM node:18-alpine As production

COPY --chown=node:node --from=build /usr/src/app/node_modules ./node_modules
COPY --chown=node:node --from=build /usr/src/app/dist ./dist

CMD [ "node", "dist/main.js" ]