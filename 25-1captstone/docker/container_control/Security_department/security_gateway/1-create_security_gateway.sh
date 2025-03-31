docker create -it \
--add-host security_gateway.localdomain:172.19.20.1 \
--hostname security_gateway \
--name security_gateway \
${image_tag} bash;

docker start security_gateway;

#앞단에 스위치를 둘것인지 아니면 바로 다른 컨테이너와 연결되게끔 할것인지
#docker network connect (네트워크명) --ip (상대 IP) security01;
