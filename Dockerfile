FROM golang:1.26-alpine
WORKDIR /usr/src/evaluation-service
#otimiza o build aproveitando o cache do docker
#primeiro copia os arquivos de dependências que não costuma mudar
COPY go* . 
RUN go mod tidy
COPY . .
CMD ["go", "run", "."]