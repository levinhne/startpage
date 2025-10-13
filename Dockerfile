FROM alpine:3.21 AS base

WORKDIR /app

# Tải binary release v0.8.4
RUN apk add --no-cache curl \
  && curl -L -o glance-linux-amd64.tar.gz https://github.com/glanceapp/glance/releases/download/v0.8.4/glance-linux-amd64.tar.gz \
  && tar -xzf glance-linux-amd64.tar.gz \
  && rm glance-linux-amd64.tar.gz

COPY config ./config

EXPOSE 8080

ENTRYPOINT ["/app/glance", "--config", "/app/config/glance.yml"]
