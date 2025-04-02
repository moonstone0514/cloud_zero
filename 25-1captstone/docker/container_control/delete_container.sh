echo -e "\n\033[1;32mHost are being terminated...\033[0m\n"

docker stop security01 security02 security03 security04 security05 security06 security07 security08 security09 security10 > /dev/null 2>&1
docker rm -f security01 security02 security03 security04 security05 security06 security07 security08 security09 security10 > /dev/null 2>&1
docker ps  -a

echo -e "\n\033[1;32mdone.\033[0m\n"