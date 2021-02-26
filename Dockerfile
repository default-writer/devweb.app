FROM golang:alpine AS build
RUN apk update && apk --no-cache add gcc g++ make git
WORKDIR /go/src/app
COPY main.go .
RUN go mod init main
RUN go mod tidy
RUN GOOS=linux go build -ldflags="-s -w" -o ./bin/web-app ./main.go

FROM alpine:latest
RUN apk --no-cache add ca-certificates
WORKDIR /usr/bin
COPY --from=build /go/src/app/bin /go/bin
EXPOSE 80
ENTRYPOINT /go/bin/web-app --port 80