FROM golang:1.19.5-alpine3.17 AS build

WORKDIR /app

COPY server.go go.mod go.sum ./

RUN go mod download

RUN go build -o /server


FROM alpine:3.17.1

WORKDIR /app

COPY --from=build /server /server

EXPOSE 8484

ENTRYPOINT ["/server"]
