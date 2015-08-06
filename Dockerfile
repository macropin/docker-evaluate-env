FROM alpine:latest

MAINTAINER Andrew Cutler <andrew@panubo.com>

RUN apk add --update bash && rm -rf /var/cache/apk/*

COPY run.sh /run.sh

CMD ["/run.sh", "/input/", "/output"]
