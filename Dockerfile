FROM ubuntu:16.04

ARG user=rust
RUN useradd -r -g users ${user} && mkdir -p /home/${user} && chown ${user} /home/${user}

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        curl \
        git \
        ca-certificates \
        build-essential \
    && rm -rf /var/lib/apt/lists/*

USER ${user}

RUN curl https://sh.rustup.rs -sSf | sh -s -- --default-toolchain stable -y
ENV PATH ${PATH}:/home/${user}/.cargo/bin

WORKDIR /home/${user}
