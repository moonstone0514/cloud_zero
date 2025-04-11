echo "[+] Minikube Docker 환경 적용"
eval $(minikube docker-env)

echo "[+] 사용자 docker 그룹 추가"
sudo usermod -aG docker $USER && newgrp docker

echo "[+] Minikube 시작 (CNI: Calico)"
minikube start --cni=calico