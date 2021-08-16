FROM docker.io/library/golang:1.6-alpine AS build
COPY main.go .
RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o app .

FROM scratch
COPY --from=build /go/app /bin/
EXPOSE 8080
CMD ["app"]
