FROM node:18-alpine
WORKDIR /app

# Enable Corepack for Yarn version management
RUN corepack enable

# Copy package files
COPY package.json yarn.lock ./

# Install production dependencies with the correct Yarn version
RUN yarn install --production

# Copy your pre-built files
COPY build/ ./build/
COPY dist/ ./dist/
COPY public/ ./public/
COPY .env ./.env

EXPOSE 3000

# Start the server
CMD ["yarn", "serve"]