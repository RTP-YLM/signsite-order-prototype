FROM node:22-alpine AS builder
WORKDIR /app
COPY package.json ./
COPY index.html ./
COPY assets ./assets
COPY scripts ./scripts
RUN npm run build

FROM node:22-alpine AS runner
ENV NODE_ENV=production
WORKDIR /app
COPY package.json server.js ./
COPY --from=builder /app/dist ./dist
USER node
EXPOSE 4173
CMD ["node", "server.js"]
