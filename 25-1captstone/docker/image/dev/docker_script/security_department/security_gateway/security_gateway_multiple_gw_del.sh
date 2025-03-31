#!/usr/bin/env bash
set -e

#############################################
# 게이트웨이 컨테이너 정책 라우팅 설정 스크립트
#
# 외부 네트워크:
#   - CIDR: 172.21.2.0/24
#   - 사용 인터페이스: eth1
#   - 출발 IP: 172.21.2.1
#   - 기본 게이트웨이: 172.21.2.1
#
# 내부 네트워크:
#   - CIDR: 192.168.20.0/24
#
# 라우팅 테이블 이름(네트워크 브릿지명): bridge_net
#############################################

# 변수 설정
TABLE_NAME="bridge_net"
EXT_SUBNET="172.21.2.0/24"  # 외부 네트워크 CIDR
EXT_DEV="eth1"              # 외부 네트워크에 사용하는 인터페이스
EXT_SRC="172.21.2.1"        # 외부 인터페이스의 출발 IP (게이트웨이 컨테이너의 외부 IP)
EXT_GW="172.21.2.1"         # 외부 기본 게이트웨이 IP
INT_SUBNET="192.168.20.0/24"  # 내부 네트워크(보안 부서 VLAN)의 CIDR

echo ">> 정책 라우팅 테이블(${TABLE_NAME}) 구성 시작"

# 외부 네트워크에 대한 라우트 추가
echo ">> ${EXT_SUBNET} 네트워크에 대한 라우트 추가: dev ${EXT_DEV}, src ${EXT_SRC}"
ip route del ${EXT_SUBNET} dev ${EXT_DEV} src ${EXT_SRC} table ${TABLE_NAME} || true

echo ">> 기본 경로 설정: default via ${EXT_GW} dev ${EXT_DEV}"
ip route del default via ${EXT_GW} dev ${EXT_DEV} table ${TABLE_NAME} || true

# 내부 네트워크에 대한 정책 라우팅 설정
echo ">> 내부 네트워크 ${INT_SUBNET}에서 발생하는 트래픽은 ${TABLE_NAME} 테이블을 사용 (from rule)"
ip rule del from ${INT_SUBNET} table ${TABLE_NAME} || true

echo ">> 내부 네트워크 ${INT_SUBNET}으로 향하는 트래픽은 ${TABLE_NAME} 테이블을 사용 (to rule)"
ip rule del to ${INT_SUBNET} table ${TABLE_NAME} || true

echo ">> 게이트웨이 컨테이너 정책 라우팅 설정 완료