ARG ALPINE_VERSION
FROM alpine:${ALPINE_VERSION} as alpine

ARG POSTGRES_VERSION
# Add the --repository flag to pull from the edge/main branch
RUN apk add --no-cache --repository=http://dl-cdn.alpinelinux.org/alpine/edge/main postgresql18-client aws-cli
WORKDIR /scripts

COPY backup.sh .
ENTRYPOINT [ "sh", "backup.sh" ]
