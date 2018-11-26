ARG DOCKER=latest
FROM docker:${DOCKER}-git
LABEL maintainer="mat@fax.fyi"

RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/main" >> /etc/apk/repositories
RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories
RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories

ARG VERSION
ARG BUILD_DATE
ARG VCS_REF

RUN apk upgrade --no-cache --available
RUN apk add --no-cache git openssh ca-certificates docker-compose grep

LABEL org.label-schema.build-date=$BUILD_DATE \
      org.label-schema.vcs-url="https://github.com/gofunky/docker" \
      org.label-schema.vcs-ref=$VCS_REF \
      org.label-schema.version=$VERSION \
      org.label-schema.schema-version="1.0"

ENTRYPOINT ["docker"]
CMD ["--help"]
