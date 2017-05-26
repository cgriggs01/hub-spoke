# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure(2) do |config|

  # server1
  config.vm.define "server1" do |server1|
    server1.vm.box = "rcgenova/hashicorp-sandbox"
    server1.ssh.insert_key = false
    server1.vm.network "private_network", ip: "192.168.33.2"

    server1.vm.provision "shell", inline: <<-SHELL
     echo "192.168.33.2" >> /tmp/IP_ADDRESS
     echo "192.168.33.2" >> /tmp/SERVER_IP_ADDRESS
     echo "1" >> /tmp/SERVER_COUNT
    SHELL
    server1.vm.provision "shell", inline: <<-SHELL
     bash /ops/scripts/server.sh
     cp /vagrant/serv1.sh /home/vagrant/demo.sh
     chmod 777 /home/vagrant/demo.sh

    SHELL

  end

  # server2
  config.vm.define "server2" do |server2|
    server2.vm.box = "rcgenova/hashicorp-sandbox"
    server2.ssh.insert_key = false
    server2.vm.network "private_network", ip: "192.168.33.3"

    server2.vm.provision "shell", inline: <<-SHELL
     echo "192.168.33.3" >> /tmp/IP_ADDRESS
     echo "192.168.33.3" >> /tmp/SERVER_IP_ADDRESS
     echo "1" >> /tmp/SERVER_COUNT
    SHELL
    server2.vm.provision "shell", inline: <<-SHELL
     bash /ops/scripts/server.sh
     touch /tmp/consul.json
     cat /etc/consul.d/consul.json | jq --arg datacenter dc2 '. + {datacenter: $datacenter}' > /tmp/consul.json
     mv /tmp/consul.json /etc/consul.d/consul.json
     service consul restart
     cp /vagrant/serv2.sh /home/vagrant/demo.sh
     chmod 777 /home/vagrant/demo.sh

    SHELL

  end

  # server3
  config.vm.define "server3" do |server3|
    server3.vm.box = "rcgenova/hashicorp-sandbox"
    server3.ssh.insert_key = false
    server3.vm.network "private_network", ip: "192.168.33.4"

    server3.vm.provision "shell", inline: <<-SHELL
     echo "192.168.33.4" >> /tmp/IP_ADDRESS
     echo "192.168.33.4" >> /tmp/SERVER_IP_ADDRESS
     echo "1" >> /tmp/SERVER_COUNT
    SHELL
    server3.vm.provision "shell", inline: <<-SHELL
     bash /ops/scripts/server.sh
     touch /tmp/consul.json
     cat /etc/consul.d/consul.json | jq --arg datacenter dc3 '. + {datacenter: $datacenter}' > /tmp/consul.json
     mv /tmp/consul.json /etc/consul.d/consul.json
     service consul restart
     cp /vagrant/serv3.sh /home/vagrant/demo.sh
     chmod 777 /home/vagrant/demo.sh

    SHELL

  end

  # provider
  config.vm.provider "virtualbox" do |vb|
    vb.memory = "1024"
    vb.cpus = 1
  end

end
