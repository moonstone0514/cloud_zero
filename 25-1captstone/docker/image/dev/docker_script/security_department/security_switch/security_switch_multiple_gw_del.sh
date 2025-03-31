# for N2 link
ip route del 172.21.2.0/24 dev eth1 src 172.21.2.2 table rt_n2_link;
ip route del default via 172.21.2.1 dev eth1 table rt_n2_link;
ip rule del from 192.168.2.0/24 table rt_n2_link;
ip rule del to 192.168.2.0/24 table rt_n2_link;