FROM golang:1.26-alpine

WORKDIR /usr/src/evaluation-service

COPY go.mod go.sum .env main.go evaluator.go sqs.go types.go handlers.go  /usr/src/evaluation-service/

CMD ["go mod tidy"]

RUN go run .