FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y suricata

# Suricata 설정 및 룰 복사
COPY rules/suricata.rules /etc/suricata/rules/suricata.rules

CMD ["suricata", "-i", "eth0"]