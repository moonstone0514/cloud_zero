ARG dist='icsr_open5gs'
ARG tag='base'

FROM ${dist}:${tag}

# Install rsyslog, curl, wget
RUN apt-get install -y \
        iptables \
        rsyslog \
        wget \
        curl && \
    apt-get clean

# Install ELK-Stack (Filebeat, Logstash, ElasticSearch, Kibana)
# RUN wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo gpg --dearmor -o /usr/share/keyrings/elasticsearch-keyring.gpg
# RUN echo 'deb [signed-by=/usr/share/keyrings/elasticsearch-keyring.gpg] https://artifacts.elastic.co/packages/8.x/apt stable main' | sudo tee /etc/apt/sources.list.d/elastic-8.x.list

COPY KMU.crt /usr/local/share/ca-certificates/

RUN update-ca-certificates

RUN curl -fsSL https://artifacts.elastic.co/GPG-KEY-elasticsearch |sudo gpg --dearmor -o /usr/share/keyrings/elastic.gpg

RUN echo "deb [signed-by=/usr/share/keyrings/elastic.gpg] https://artifacts.elastic.co/packages/7.x/apt stable main" | sudo tee -a /etc/apt/sources.list.d/elastic-7.x.list

RUN apt-get update

RUN apt-get update && apt-get install -y \
        apt-transport-https \
        openjdk-11-jdk && \
    apt-get clean

RUN pip3 install joblib\
        pandas\
        scikit-learn

RUN apt-get install -y elasticsearch && apt-get clean

RUN apt-get install -y kibana && apt-get clean

RUN apt-get install -y logstash && apt-get clean

RUN apt-get install -y filebeat && apt-get clean
#Install Tshark
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y tshark

# Install Suricata
RUN apt-get install -y software-properties-common
RUN add-apt-repository ppa:oisf/suricata-stable

Run apt-get update

RUN apt-get install -y suricata && apt-get clean

# Install MongoDB
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y \
        gnupg && \
    apt-get clean

RUN curl -fsSL https://pgp.mongodb.com/server-4.4.asc | \
   sudo gpg -o /usr/share/keyrings/mongodb-server-4.4.gpg \
   --dearmor
RUN echo "deb [ arch=amd64,arm64 signed-by=/usr/share/keyrings/mongodb-server-4.4.gpg ] https://repo.mongodb.org/apt/ubuntu bionic/mongodb-org/4.4 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.4.list

RUN apt-get update && apt-get install -y \
        mongodb-org && \
    apt-get clean


# Install WebUI of Open5GS
RUN curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | \
    sudo gpg --dearmor -o /usr/share/keyrings/nodesource.gpg
RUN echo "deb [signed-by=/usr/share/keyrings/nodesource.gpg] https://deb.nodesource.com/node_16.x nodistro main" | sudo tee /etc/apt/sources.list.d/nodesource.list

RUN apt-get update && apt-get install -y \
        nodejs \
        expect && \
    apt-get clean

WORKDIR /root
COPY docker_script/ /root/

RUN mkdir open5gs
  
RUN echo '10      rt_n2_link' >> /etc/iproute2/rt_tables; \
    echo '20      rt_n3_link' >> /etc/iproute2/rt_tables; \
    echo '30      rt_n4_link' >> /etc/iproute2/rt_tables; \
    echo '40      rt_n11_link' >> /etc/iproute2/rt_tables; \
    echo '50      rt_n12_link' >> /etc/iproute2/rt_tables; \
    echo '60      rt_n13_link' >> /etc/iproute2/rt_tables; \
    echo '70      rt_n6_link' >> /etc/iproute2/rt_tables; \
    echo '80      rt_sbi_link' >> /etc/iproute2/rt_tables; \
    echo '90      rt_n7_link' >> /etc/iproute2/rt_tables; \
    echo '100     rt_n15_link' >> /etc/iproute2/rt_tables; \
    echo '110     rt_n35_link' >> /etc/iproute2/rt_tables; \
    echo '120     rt_n36_link' >> /etc/iproute2/rt_tables; \
    echo '130     rt_n22_link' >> /etc/iproute2/rt_tables; \
    echo '140     rt_n8_link' >> /etc/iproute2/rt_tables; \
    echo '150     rt_n10_link' >> /etc/iproute2/rt_tables; \
    echo '160     rt_n55_link' >> /etc/iproute2/rt_tables;
    
COPY init.d/ /etc/init.d/