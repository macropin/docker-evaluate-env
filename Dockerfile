FROM alpine:latest

MAINTAINER Andrew Cutler <andrew@panubo.com>

COPY run.sh /run.sh

CMD ["/run.sh", "/input/", "/output"]
