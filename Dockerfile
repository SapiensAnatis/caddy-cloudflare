FROM --platform=$BUILDPLATFORM caddy:2.11.4-builder AS builder

ARG TARGETOS
ARG TARGETARCH

RUN GOOS=${TARGETOS} GOARCH=${TARGETARCH} xcaddy build --with github.com/caddy-dns/cloudflare

FROM caddy:2.11.4

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
