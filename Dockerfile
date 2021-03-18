FROM golang:alpine AS build
RUN apk update && apk --no-cache add gcc g++ make git
WORKDIR /workspace
COPY . .
RUN if [[ ! -f go.mod ]]; then go mod init main && go mod tidy; fi && GOOS=linux go build -ldflags="-s -w" -o bin/web-app /workspace/main.go

FROM alpine:latest as alpine
RUN apk --no-cache add ca-certificates go git && go get -v golang.org/x/tools/gopls && go get -v github.com/go-delve/delve/cmd/dlv
WORKDIR /usr/bin
COPY --from=build /workspace/bin /go/bin
EXPOSE 80
ENTRYPOINT /go/bin/web-app --port 80