FROM alpine:latest

RUN apk add --no-cache lighttpd
RUN apk add --no-cache curl
RUN apk add --no-cache ffmpeg
RUN apk add --no-cache bash
RUN mkdir /tmp/www

ADD grab.sh /
ADD lighttpd.conf /

EXPOSE 80

HEALTHCHECK CMD curl --fail http://localhost/snapshot.jpg || exit 1

ENTRYPOINT ["/grab.sh"]

