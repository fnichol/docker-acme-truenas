# hadolint ignore=DL3007
FROM neilpang/acme.sh:latest

ARG NAME
ARG VERSION
ARG REVISION
ARG CREATED

ARG SOURCE=https://github.com/fnichol/docker-acme-truenas.git

LABEL \
  name="$NAME" \
  org.opencontainers.image.version="$VERSION" \
  org.opencontainers.image.authors="Fletcher Nichol <fnichol@nichol.ca>" \
  org.opencontainers.image.licenses="MIT" \
  org.opencontainers.image.source="$SOURCE" \
  org.opencontainers.image.revision="$REVISION" \
  org.opencontainers.image.created="$CREATED"

# hadolint ignore=DL3018,DL3047
RUN apk add --no-cache python3 py3-requests \
  && wget \
    -O /tmp/master.tar.gz \
    https://github.com/danb35/deploy-freenas/archive/refs/heads/master.tar.gz \
  && tar \
    -xvzf /tmp/master.tar.gz \
    -C /usr/local/bin \
    --strip 1 \
    deploy-freenas-master/deploy_freenas.py \
  && chmod 755 /usr/local/bin/deploy_freenas.py \
  && rm -f /tmp/master.tar.gz \
  && echo "name=$NAME" > /etc/image-metadata \
  && echo "version=$VERSION" >> /etc/image-metadata \
  && echo "source=$SOURCE" >> /etc/image-metadata \
  && echo "revision=$REVISION" >> /etc/image-metadata \
  && echo "created=$CREATED" >> /etc/image-metadata
