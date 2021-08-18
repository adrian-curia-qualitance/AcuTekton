FROM docker.io/bitnami/node:14 AS build
WORKDIR /app
COPY / ./
COPY package*.json ./
RUN npm install -g @angular/cli@12.2.0 && \
    npm install && \
    ng build
COPY . .

FROM docker.io/bitnami/nginx:1.21
WORKDIR /app
COPY --from=build /app/dist/ac-ngd-test /usr/share/nginx/html
