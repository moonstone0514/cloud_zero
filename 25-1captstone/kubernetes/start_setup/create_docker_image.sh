#!/bin/bash
# 모든 Docker 이미지 빌드 스크립트

BASE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

echo "[+] Docker 이미지 빌드 시작..."

docker build -t cloud_project:base -f "$BASE_DIR/image/base/Dockerfile" "$BASE_DIR"
docker build -t cloud_project:dev -f "$BASE_DIR/image/dev/Dockerfile" "$BASE_DIR"
docker build -t suricata-local -f "$BASE_DIR/image/suricata/Dockerfile" "$BASE_DIR/image/suricata"

echo "[+] 빌드 완료. 현재 이미지 목록:"
docker images | grep -E 'cloud_project|suricata-local'
