FROM hugomods/hugo:0.145.0 AS builder
WORKDIR /src
COPY . .
RUN hugo --minify

FROM nginx:1.27-alpine
COPY --from=builder /src/public/ /usr/share/nginx/html/
COPY nginx.conf /etc/nginx/conf.d/default.conf
