docker network create \
  --driver bridge \
  --subnet=192.168.10.0/24 \
  --gateway=192.168.10.1 \
  security_net


docker network connet security_net security_switch

docker network connet security_net security01
docker network connet security_net security02
docker network connet security_net security03
docker network connet security_net security04
docker network connet security_net security05
docker network connet security_net security06
docker network connet security_net security07
docker network connet security_net security08
docker network connet security_net security09
docker network connet security_net security10