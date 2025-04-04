ARG dist='cloud_project'
ARG tag='base'

FROM ${dist}:${tag}

# Install rsyslog, curl, wget
RUN apt-get install -y \
        iptables \
        rsyslog \
        wget \
        curl && \
    apt-get clean

WORKDIR /root
