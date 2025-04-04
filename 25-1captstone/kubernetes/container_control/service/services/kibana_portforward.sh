echo "[+] Kibana 포트포워딩 시작 (5601)"
kubectl port-forward pod/$(kubectl get pod -l app=kibana -o jsonpath="{.items[0].metadata.name}") 5601:5601 >/dev/null 2>&1 &
echo "→ http://localhost:5601"