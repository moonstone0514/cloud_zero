#!/bin/bash

# 전체 리소스 순차 실행

echo "[1] ServiceAccount + RBAC 설정"
kubectl apply -f ../serviceaccount/
kubectl apply -f ../rbac/

echo "[2] Pod (Deployment) 생성"
kubectl apply -f ../deployments/

echo "[3] 서비스 (Splunk, Suricata, ELK) 생성"
kubectl apply -f ../services/

echo "[4] 네트워크 정책 생성"
kubectl apply -f ../networkpolicy/


echo -e "\n\n\n\n\n=============POD 결과 출력============="
kubectl get pods


echo "[5] splunk 포트포워딩 수행 8000번"
kubectl apply -f ../service/services/splunk_portforward.sh
echo "splunk 포트포워딩 실행 완료"


echo "[6] elasticsearch 포트포워딩 수행 9200번"
kubectl apply -f ../service/services/splunk_portforward.sh
echo "[6] elasticsearch 포트포워딩 실행 완료"


echo "[7] kibana 포트포워딩 수행 5601번"
kubectl apply -f ../service/services/splunk_portforward.sh
echo "[7] kibana 포트포워딩 실행완료"
