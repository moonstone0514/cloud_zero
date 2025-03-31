# Create base docker image For open5gs v2.6.4
# Edit date: 2023-11-01

ARG dist=ubuntu
ARG tag=focal

FROM ${dist}:${tag}

# For Korean
RUN sed -i 's/archive.ubuntu.com/mirror.kakao.com/' /etc/apt/sources.list

RUN apt-get update && \
    apt-get upgrade -y && \
    DEBIAN_FRONTEND=noninteractive \
    apt-get install -y --no-install-recommends \
        python3-pip \
        python3-setuptools \
        python3-wheel \
        ninja-build \
        build-essential \
        flex \
        bison \
        git \
        cmake \
        meson \
        libsctp-dev \
        libgnutls28-dev \
        libgcrypt-dev \
        libssl-dev \
        libidn11-dev \
        libmongoc-dev \
        libbson-dev \
        libyaml-dev \
        libmicrohttpd-dev \
        libcurl4-gnutls-dev \
        libnghttp2-dev \
        libtins-dev \
        libtalloc-dev \
        iproute2 \
        ca-certificates \
        netbase \
        pkg-config \
        git-buildpackage \
        debhelper \
        devscripts \
        osc \
        dput \
        manpages-dev \
        fakeroot \
        cscope \
        vim \
        sudo \
        iputils-ping \
        gdb\
        net-tools && \
    apt-get clean

WORKDIR /root

