FROM debian:buster-slim

ARG JOHN_VERSION="john-1.9.0-jumbo-1"
ARG JOHN_URL="https://www.openwall.com/john/k/${JOHN_VERSION}.tar.gz"
ENV JOHN_DIR /home/john/john-1.9.0-jumbo-1

RUN apt-get update && \
    apt-get install -yq curl net-tools bash make gcc openssl libgmp-dev ocl-icd-opencl-dev libssl-dev libbz2-dev zlib1g-dev libpcap-dev && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN adduser --disabled-password --gecos '' john
USER john
WORKDIR /home/john

RUN curl "$JOHN_URL" -o john.tar.gz && \
    tar zfxv john.tar.gz && rm john.tar.gz && echo $(ls)
WORKDIR $JOHN_DIR/src
RUN sh configure && \
    make -s clean && \
    make -sj4 && \
    cp "$JOHN_DIR/run/john" "${HOME}" && \
    rm -rf "${JOHN_DIR}"

CMD ["/bin/bash"]



