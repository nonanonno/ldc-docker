FROM --platform=$TARGETPLATFORM ubuntu:20.04 AS build

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install -y \
  wget \
  gpg \
  lldb \
  make \
  curl \
  xz-utils \
  libxml2 \
  clang \
  git \
  && rm -rf /var/lib/apt/*

ENV CC clang

COPY install_openssl.sh /tmp/
RUN cd /tmp && bash install_openssl.sh 1.1.1k

ARG LDC_VERSION
ARG TARGETPLATFORM
COPY install_ldc.sh /tmp/
RUN cd /tmp && bash install_ldc.sh ${TARGETPLATFORM} ${LDC_VERSION}
ENV PATH $PATH:/tmp/ldc2/bin
COPY install_tools.sh /tmp/
RUN cd /tmp && bash install_tools.sh


FROM ubuntu:20.04
ENV DEBIAN_FRONTEND noninteractive
COPY --from=build /usr/local/ssl /usr/local/ssl
COPY --from=build /tmp/ldc2 /usr/local/
COPY --from=build /opt/dlang/DCD/bin/dcd-client /opt/dlang/DCD/bin/dcd-server /opt/dlang/serve-d/serve-d /usr/local/bin/
RUN echo "/usr/local/ssl/lib" > /etc/ld.so.conf.d/0-openssl-1.1.1k.conf \
  && ldconfig \
  && apt-get update && apt-get install -y --no-install-recommends \
  libxml2 \
  clang \
  curl \
  && rm -rf /var/lib/apt/*

