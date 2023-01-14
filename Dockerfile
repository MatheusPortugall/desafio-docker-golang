FROM golang:1.19 AS build

WORKDIR /app

COPY . ./app

RUN go build ./app/main.go


FROM scratch

WORKDIR /app

COPY --from=build ./app .

EXPOSE 8000

ENTRYPOINT ["/app/main"]