sudo lxc-start -n speaker2 -d
sudo lxc-start -n bgp2 -d
sudo lxc-start -n gw2 -d
sudo lxc-start -n host2


sudo ovs-vsctl del-br br-sdx2
sudo ovs-vsctl add-br br-sdx2 
sudo ovs-vsctl add-port br-sdx2 gw2.1
sudo ovs-vsctl add-port br-sdx2 speaker2.1
sudo ovs-vsctl add-port br-sdx2 speaker2.2
sudo ovs-vsctl add-port br-sdx2 bgp2.1
sudo ovs-vsctl set bridge br-sdx2 other-config:datapath-id=0000000000000002
sudo ovs-vsctl set-controller br-sdx2 tcp:172.20.90.101:6633

sudo ovs-vsctl del-br sw2
sudo ovs-vsctl add-br sw2 
sudo ovs-vsctl add-port sw2 bgp2.2
sudo ovs-vsctl add-port sw2 host2

sudo ifconfig gw2.1 up
sudo ifconfig speaker2.1 up
sudo ifconfig speaker2.2 up
sudo ifconfig bgp2.1 up
sudo ifconfig bgp2.2 up
sudo ifconfig host2 up