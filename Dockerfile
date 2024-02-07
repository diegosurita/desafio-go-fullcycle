FROM golang:1.22-alpine AS builder

WORKDIR /app

COPY go.mod /app/go.mod
COPY main.go /app/main.go

RUN go build -v -o main .

FROM scratch

COPY --from=builder /app/ /app/

CMD [ "/app/main" ]