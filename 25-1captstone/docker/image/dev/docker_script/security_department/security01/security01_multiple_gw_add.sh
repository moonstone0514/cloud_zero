# for N2 link
# ip route add 172.21.2.0/24 dev eth1 src 172.21.2.2 table rt_n2_link;
# ip route add default via 172.21.2.1 dev eth1 table rt_n2_link;
# ip rule add from 192.168.2.0/24 table rt_n2_link;
# ip rule add to 192.168.2.0/24 table rt_n2_link;

ip route add