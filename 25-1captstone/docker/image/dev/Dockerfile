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
COPY docker_script/ /root/

RUN mkdir Cloud_Project
  
RUN echo '10      eth_1_link' >> /etc/iproute2/eth_tables; \
    echo '20      eth_2_link' >> /etc/iproute2/eth_tables; \
    echo '30      eth_4_link' >> /etc/iproute2/eth_tables; \
    echo '40      eth_11_link' >> /etc/iproute2/eth_tables; \
    echo '50      eth_12_link' >> /etc/iproute2/eth_tables; \
    echo '60      eth_13_link' >> /etc/iproute2/eth_tables; \
    echo '70      eth_6_link' >> /etc/iproute2/eth_tables; \
    echo '80      eth_bridge_link' >> /etc/iproute2/eth_tables; \
    echo '90      eth_7_link' >> /etc/iproute2/eth_tables; \
    echo '100     eth_15_link' >> /etc/iproute2/eth_tables; \
    echo '110     eth_35_link' >> /etc/iproute2/eth_tables; \
    echo '120     eth_36_link' >> /etc/iproute2/eth_tables; \
    echo '130     eth_22_link' >> /etc/iproute2/eth_tables; \
    echo '140     eth_8_link' >> /etc/iproute2/eth_tables; \
    echo '150     eth_10_link' >> /etc/iproute2/eth_tables; \
    echo '160     eth_55_link' >> /etc/iproute2/eth_tables;
    