FROM golang:1.22-alpine AS builder

WORKDIR /app

COPY go.mod /app/go.mod
COPY main.go /app/main.go

RUN go build -v -o main .
RUN ls -la

FROM alpine:3.19.1

COPY --from=builder /app/ /app/
RUN chmod +x /app/main

CMD [ "/app/main" ]