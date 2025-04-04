#!/bin/bash

echo "[+] Elasticsearch 포트포워딩 시작 (9200)"
kubectl port-forward pod/$(kubectl get pod -l app=elasticsearch -o jsonpath="{.items[0].metadata.name}") 9200:9200 >/dev/null 2>&1 &
echo "→ http://localhost:9200"