#!/bin/bash
# Docker 이미지 빌드

echo "[+] Docker 이미지 빌드 시작..."
docker build -t cloud_project:base -f ../image/base/Dockerfile .
docker build -t cloud_project:dev -f ../image/dev/Dockerfile .
echo "[+] 빌드된 이미지 목록:"
docker images | grep cloud_project