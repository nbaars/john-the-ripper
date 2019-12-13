FROM debian:buster-slim

#https://www.openwall.com/john/k/john-1.9.0-jumbo-1.tar.gz
ARG JOHN_URL
ENV JOHN_DIR=/home/john/john-1.9.0-jumbo-1

RUN apt-get update --no-install-recommends && \
    apt-get install -yq --no-install-recommend curl net-tools bash make gcc openssl libgmp-dev ocl-icd-opencl-dev libssl-dev libbz2-dev zlib1g-dev libpcap-dev && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN adduser --disabled-password --gecos '' john
USER john
WORKDIR /home/john

RUN curl "$JOHN_URL" -o john.tar.gz && \
    tar zfxv john.tar.gz && rm john.tar.gz
WORKDIR "$JOHN_DIR"
RUN sh configure && \
    make -s clean && \
    make -sj4 && \
    cp "$JOHN_DIR/run/john" "${HOME}" && \
    rm -rf "${JOHN_DIR}"

CMD ["/bin/bash"]



