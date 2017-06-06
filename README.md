# hub-spoke
Demo for Consul Hub and Spoke functionality

This guide will walk you through a simple simple implimentation and testing
of Consul's Hub and Spoke topography. In this demo you will create 3 consul
agents from the Vagrantfile. Each agent is in a different datacenter; dc1, dc2 dc3.



vagrant up


(in three seperate terminals)
vagrant ssh server1
vagrant ssh server2
vagrant ssh server3

from each terminal run
./demo.sh

from here you can press and key to step through the demo

Order of steps

          H    H
        HHH    HHH  H
      HHH      HHH  HHH
    HHH   H    HHH  HHH
  HHH   HHH    HHH  HHH
  HHH   HHH    HHH  HHH
  HHH   HHHHHHHHHH  HHH
  HHH   HHH    HHH  HHH
  HHH   HHH    HHH  HHH 
  HHH   HHH    H   HHH
   HH   HHH      HHH
    H   HHH    HHH
          H    H
