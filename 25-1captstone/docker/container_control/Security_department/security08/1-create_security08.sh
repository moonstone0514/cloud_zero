docker create -it \
--add-host security08.localdomain:172.21.10.10 \
--volume ${here%/*/*}/main:/root/cloud_project:rw \
--hostname security08 \
--name security08 \
cloud_project:dev bash;

docker start security08;

#앞단에 스위치를 둘것인지 아니면 바로 다른 컨테이너와 연결되게끔 할것인지
#docker network connect (네트워크명) --ip (상대 IP) security01;

docker network connect --ip 172.21.10.10 security_net security08