docker create -it \
--add-host security01.localdomain:172.19.0.1 \
--hostname security01 \
--name security01 \
${image_tag} bash;

docker start security01;

#앞단에 스위치를 둘것인지 아니면 바로 다른 컨테이너와 연결되게끔 할것인지
#docker network connect (네트워크명) --ip (상대 IP) security01;
