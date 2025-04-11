ARG dist='cloud_project'
ARG tag='base'

FROM ${dist}:${tag}

# 필수 패키지 설치 (dos2unix 포함)
RUN apt-get update && apt-get install -y \
        iptables \
        rsyslog \
        wget \
        curl \
        dos2unix && \
    apt-get clean

# 작업 디렉토리 설정
WORKDIR /root

# 쉘 스크립트가 있는 디렉토리 복사 (필요한 경로에 맞게 조정)
COPY . .

# 모든 .sh 파일의 줄바꿈 형식 변환 (Windows -> Unix)
RUN find . -type f -name "*.sh" -exec dos2unix {} \;

# 실행 권한 부여 (필요 시)
RUN chmod +x *.sh
