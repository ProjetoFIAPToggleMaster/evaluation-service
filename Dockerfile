FROM golang:1.26-alpine

WORKDIR /usr/src/evaluation-service

COPY go.mod go.sum .env main.go evaluator.go sqs.go types.go handlers.go  /usr/src/evaluation-service/

RUN <<EOF
    apk update
    apk install curl
    curl -X POST http://localhost:8001/admin/keys \
    -H "Content-Type: application/json" \
    -H "Authorization: Bearer admin-secreto-123" \
    -d '{"name": "evaluation-service-key"}'
EOF

