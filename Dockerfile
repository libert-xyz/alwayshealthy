# Build stage
FROM golang:1.22-alpine AS builder
RUN apk add --no-cache upx
WORKDIR /src
COPY main.go .
RUN CGO_ENABLED=0 go build -ldflags="-s -w" -o healthcheck main.go

# Final minimal image
FROM scratch
COPY --from=builder /src/healthcheck /healthcheck
ENTRYPOINT ["/healthcheck"]
