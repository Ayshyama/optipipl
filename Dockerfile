FROM node:18-alpine
WORKDIR /app
COPY package.json yarn.lock ./
COPY dist/ ./dist/
COPY build/ ./build/
COPY public/ ./public/
COPY .env ./.env
RUN yarn install --production
EXPOSE 3000
CMD ["yarn", "serve"]