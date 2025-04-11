#!/bin/bash
# 전체 셋업을 위한 엔트리 포인트 스크립트

BASE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

echo "[+] 도커 이미지 빌드 스크립트 실행 중..."
bash "$BASE_DIR/image/docker_image_build.sh"

echo "[+] 쿠버네티스 리소스 전체 설정 스크립트 실행 중..."
bash "$BASE_DIR/container_control/full_setup.sh"
