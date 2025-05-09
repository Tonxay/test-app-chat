# build executable binary
FROM golang:1.23.2-alpine as builder

ENV CGO_ENABLED 0
ENV GOOS "linux"
ENV GOARCH "amd64"

WORKDIR /build

COPY go.mod .
COPY go.sum .
RUN apk add --no-cache ca-certificates git tzdata && go mod tidy

COPY . .

RUN go build -ldflags "-s -w -extldflags '-static'" -installsuffix cgo -o /bin/api-app main.go

# Use alpine image as runtime
FROM alpine:3.16 as release

COPY --from=builder /usr/share/zoneinfo /usr/share/zoneinfo
COPY --from=builder /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/
COPY --from=builder /bin/api-app /bin/api-app

ARG API_VERSION
ARG BUILD_DATE
ENV API_VERSION ${API_VERSION}
ENV BUILD_DATE ${BUILD_DATE}

# Command to run 
ENTRYPOINT ["/bin/api-app"]