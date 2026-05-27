FROM golang:1.26-alpine

WORKDIR /usr/src/evaluation-service

COPY go.mod go.sum