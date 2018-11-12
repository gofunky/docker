ARG DOCKER=latest
FROM docker:${DOCKER}-git
LABEL maintainer="mat@fax.fyi"

ARG VERSION
ARG BUILD_DATE
ARG VCS_REF

RUN apk add --no-cache --upgrade git openssh ca-certificates docker-compose --repository=http://dl-cdn.alpinelinux.org/alpine/edge/testing

LABEL org.label-schema.build-date=$BUILD_DATE \
      org.label-schema.vcs-url="https://github.com/gofunky/docker" \
      org.label-schema.vcs-ref=$VCS_REF \
      org.label-schema.version=$VERSION \
      org.label-schema.schema-version="1.0"

ENTRYPOINT ["docker"]
CMD ["--help"]
