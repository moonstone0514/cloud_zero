FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y suricata

# 설정 파일 복사
COPY rules/classification.config /etc/suricata/classification.config
COPY rules/reference.config /etc/suricata/reference.config

# Suricata 룰 복사
COPY rules/suricata.rules /etc/suricata/rules/suricata.rules

CMD ["suricata", "-i", "eth0"]
