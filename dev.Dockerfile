FROM golang:alpine AS build
RUN apk update && apk --no-cache add gcc g++ make git bash
WORKDIR /workspace
COPY . .
RUN if [[ ! -f go.mod ]]; then go mod init main; fi && go mod tidy && go get -v golang.org/x/tools/gopls && go get -v github.com/go-delve/delve/cmd/dlv && go get -d -v ./... && go install -v ./...

FROM build
WORKDIR /workspace
COPY --from=build /workspace /workspace
ARG PORT=8080
EXPOSE ${PORT}
CMD ["go", "run", "."]