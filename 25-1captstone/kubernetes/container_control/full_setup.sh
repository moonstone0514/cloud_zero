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