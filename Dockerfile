FROM ubuntu:18.10

ENV DEBIAN_FRONTEND=noninteractive
ARG NODE_VERSION=11

RUN apt-get update && apt-get install -y apt-transport-https curl wget gnupg

# Node
# https://github.com/nodesource/distributions/blob/master/README.md
RUN curl -sL https://deb.nodesource.com/setup_${NODE_VERSION}.x | bash -

# Yarn
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

RUN apt-get update && apt-get install -y yarn nodejs

RUN apt-get clean && rm -rf /var/lib/apt/lists/* rm -rf /tmp/*

ENV PATH="$PATH:$(yarn global bin)"
VOLUME [ "/data" ]

WORKDIR /data
ENTRYPOINT [ "yarn" ]
