docker create -it \
--add-host security04.localdomain:172.21.10.6 \
--volume ${here%/*/*}/main:/root/cloud_project:rw \
--hostname security04 \
--name security04 \
cloud_project:dev bash;

docker start security04;

#앞단에 스위치를 둘것인지 아니면 바로 다른 컨테이너와 연결되게끔 할것인지
#docker network connect (네트워크명) --ip (상대 IP) security01;

docker network connect --ip 172.21.10.6 security_net security04