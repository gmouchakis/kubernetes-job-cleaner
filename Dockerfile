FROM alpine:3.9 as download

WORKDIR /

RUN apk add curl

RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/v1.14.0/bin/linux/amd64/kubectl

RUN chmod +x ./kubectl

FROM alpine:3.9

RUN apk --no-cache add coreutils

COPY --from=download /kubectl /usr/local/bin/kubectl

COPY cleanup.sh .

CMD ["./cleanup.sh"]
