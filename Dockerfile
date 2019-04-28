# builder phase
FROM node:8-alpine as builder

WORKDIR /app

COPY package.json .
RUN npm install

COPY . .

RUN npm run build

# run phase
FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html