FROM minimum/openfalcon-golang

MAINTAINER minimum@cepave.com

# Build Open-Falcon Components
VOLUME /package
COPY openfalcon-build.sh /home/build.sh
RUN \
  apt-get update && \
  apt-get install -y git gcc && \
  chmod +x /home/build.sh
CMD ["/home/build.sh"]
