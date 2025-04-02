# for N2 link
# ip route add 172.21.0.1/24 dev eth1 src 172.21.0.3 table eth_1_link;
# ip route add default via 172.21.0.1 dev eth1 table eth_12_link;
# ip rule add from 192.168.1.0/24 table rt_n2_link;
# ip rule add to 192.168.1.0/24 table rt_n2_link;
