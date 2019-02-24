FROM reduardo7/node:8

# Yarn
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update && apt-get install -y yarn nodejs

RUN apt-get clean && rm -rf /var/lib/apt/lists/* rm -rf /tmp/*

ENV PATH="$PATH:$(yarn global bin)"
ENTRYPOINT [ "yarn" ]
