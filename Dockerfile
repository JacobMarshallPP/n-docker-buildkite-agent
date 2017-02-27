FROM buildpack-deps:xenial

RUN bash -c "`curl -sL https://raw.githubusercontent.com/buildkite/agent/master/install.sh`" && \
    bash -c "`curl -sL https://deb.nodesource.com/setup_6.x`" && \
    apt-get install -y nodejs && \
    npm i -g n && \
    n lts && \
    npm i -g gulp yarn && \
    rm -rf /var/lib/apt/lists/*

ENV BUILDKITE_AGENT_META_DATA node=true,npm=true,n=true,yarn=true

ENTRYPOINT ~/.buildkite-agent/bin/buildkite-agent start