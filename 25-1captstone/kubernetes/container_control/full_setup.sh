#!/bin/bash

BASE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

echo "[+] 쿠버네티스 리소스 적용 시작..."

kubectl apply -f "$BASE_DIR/services/splunk.yml"

# 순서대로 실행
kubectl apply -f ../services/elasticsearch.yml
sleep 10
kubectl apply -f ../services/logstash.yml
sleep 10
kubectl apply -f ../services/filebeat.yml
sleep 5
kubectl apply -f ../services/kibana.yml
sleep 5
kubectl apply -f ../deployments/suricata-daemonset.yml


kubectl apply -f "$BASE_DIR/deployments/"
kubectl apply -f "$BASE_DIR/configmap/"
kubectl apply -f "$BASE_DIR/rbac/"
kubectl apply -f "$BASE_DIR/serviceaccount/"
# kubectl apply -f "$BASE_DIR/networkpolicy/"


echo -e "\n\n\n\n\n=============POD 결과 출력============="
kubectl get pods