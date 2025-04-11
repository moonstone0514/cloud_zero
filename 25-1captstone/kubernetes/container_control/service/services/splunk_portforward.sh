# #!/bin/bash

# echo "[+] Splunk 포트포워딩 시작 (8000)"
# kubectl port-forward pod/$(kubectl get pod -l app=splunk -o jsonpath="{.items[0].metadata.name}") 8000:8000 >/dev/null 2>&1 &
# echo "→ http://localhost:8000"