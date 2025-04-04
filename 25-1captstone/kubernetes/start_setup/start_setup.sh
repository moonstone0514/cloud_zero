
#쿠버네티스를 실행하기 전 필요한 설정 및 minikube(clico) 실행을 위해 setup.sh 실행
#쿠버네티스를 처음 실행시 필요로 하는 이미지 빌드를 위한 create_docker_image.sh 실행

#!/bin/bash
# 초기 설정 및 이미지 빌드 전체 실행

bash ./setup.sh
bash ./create_docker_image.sh