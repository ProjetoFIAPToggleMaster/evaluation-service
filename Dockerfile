FROM golang:1.26-alpine

WORKDIR /usr/src/evaluation-service

COPY *go go* .env ./

RUN go mod tidy

CMD ["go", "run", "."]