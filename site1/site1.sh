sudo lxc-start -n speaker1 -d
sudo lxc-start -n bgp1 -d
sudo lxc-start -n gw1 -d
sudo lxc-start -n host1

sudo ovs-vsctl del-br br-sdx1
sudo ovs-vsctl add-br br-sdx1 
sudo ovs-vsctl add-port br-sdx1 gw1.1
sudo ovs-vsctl add-port br-sdx1 speaker1.1
sudo ovs-vsctl add-port br-sdx1 speaker1.2
sudo ovs-vsctl add-port br-sdx1 bgp1.1
sudo ovs-vsctl set bridge br-sdx1 other-config:datapath-id=0000000000000001
sudo ovs-vsctl set-controller br-sdx1 tcp:172.20.90.109:6633

sudo ovs-vsctl del-br sw1 
sudo ovs-vsctl add-br sw1 
sudo ovs-vsctl add-port sw1 bgp1.2
sudo ovs-vsctl add-port sw1 host1

sudo ifconfig gw1.1 up
sudo ifconfig speaker1.1 up
sudo ifconfig speaker1.2 up
sudo ifconfig bgp1.1 up
sudo ifconfig bgp1.2 up
sudo ifconfig host1 up
