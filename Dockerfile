FROM alpine:3.9 as build

WORKDIR /

RUN apk add curl

RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/v1.14.0/bin/linux/amd64/kubectl

RUN chmod +x ./kubectl

FROM alpine:3.9

COPY --from=build /kubectl /usr/local/bin/kubectl

COPY cleanup.sh .

CMD ["./cleanup.sh"]
