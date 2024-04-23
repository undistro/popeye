FROM alpine:3.19.0

RUN apk upgrade && rm /var/cache/apk/*

COPY popeye /bin/popeye

RUN adduser -u 5000 -D nonroot
USER 5000

ENTRYPOINT [ "/bin/popeye" ]
