FROM golang:1.21-alpine AS builder
WORKDIR /usr/src/evaluation-service
COPY go* .
RUN go mod download
COPY . .
RUN go build -o evaluation-service .

FROM alpine:3.19
WORKDIR /app
COPY --from=builder /usr/src/evaluation-service/evaluation-service .
EXPOSE 8004
CMD ["./evaluation-service"]