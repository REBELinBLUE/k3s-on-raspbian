FROM arm32v7/alpine:3.11.2

WORKDIR /tmp

ARG RESTIC_VERSION
ARG VELERO_VERSION

RUN apk add --no-cache ca-certificates \
    && apk add --no-cache --virtual build-dependencies bzip2 curl

RUN curl -k -sSfL -o ./restic_${RESTIC_VERSION}_linux_arm.bz2 https://github.com/restic/restic/releases/download/v${RESTIC_VERSION}/restic_0.9.5_linux_arm.bz2 \
    && bunzip2 restic_${RESTIC_VERSION}_linux_arm.bz2 \
    && mv restic_${RESTIC_VERSION}_linux_arm /usr/bin/restic \
    && chmod +x /usr/bin/restic

RUN curl -k -sSfL -o ./velero-${VELERO_VERSION}-linux-arm.tar.gz https://github.com/vmware-tanzu/velero/releases/download/${VELERO_VERSION}/velero-${VELERO_VERSION}-linux-arm.tar.gz \
    && tar -xvf ./velero-${VELERO_VERSION}-linux-arm.tar.gz \
    && mv velero-${VELERO_VERSION}-linux-arm/velero /velero \
    && chmod +x /velero \
    && rm -rf /tmp/*

RUN apk del build-dependencies

WORKDIR /

ENTRYPOINT ["/velero"]