# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure(2) do |config|

  # server1
  config.vm.define "server1" do |server1|
    server1.vm.box = "atlas-demo/hashi_stack"
    server1.ssh.insert_key = false
    server1.vm.network "private_network", ip: "192.168.33.2"

    server1.vm.provision "shell", inline: <<-SHELL
    cat <<EOF >/etc/consul.d/consul-network.json
    {
      "advertise_addr": "192.168.33.2",
      "cilent_addr": "192.168.33.2",
      "node_name": "consul@192.168.33.2",
      "datacenter": "dc1"
    }
EOF
    SHELL
    server1.vm.provision "shell", inline: <<-SHELL
     service consul restart
     cp /vagrant/scripts/server1.sh /home/vagrant/demo.sh
     chmod 777 /home/vagrant/demo.sh
    SHELL

  end


  # server2
  config.vm.define "server2" do |server2|
    server2.vm.box = "atlas-demo/hashi_stack"
    server2.ssh.insert_key = false
    server2.vm.network "private_network", ip: "192.168.33.3"

    server2.vm.provision "shell", inline: <<-SHELL
     cat <<EOF > /etc/consul.d/consul-network.json
      {
        "advertise_addr": "192.168.33.3",
        "client_addr": "192.168.33.3",
        "node_name": "consul@192.168.33.3",
        "datacenter": "dc2"
      }
EOF
    SHELL
    server2.vm.provision "shell", inline: <<-SHELL
     service consul restart
     cp /vagrant/scripts/server2.sh /home/vagrant/demo.sh
     chmod 777 /home/vagrant/demo.sh
    SHELL
  end

  # server3
  config.vm.define "server3" do |server3|
    server3.vm.box = "atlas-demo/hashi_stack"
    server3.ssh.insert_key = false
    server3.vm.network "private_network", ip: "192.168.33.4"

    server3.vm.provision "shell", inline: <<-SHELL
     cat <<EOF > /etc/consul.d/consul-network.json
      {
        "advertise_addr": "192.168.33.4",
        "client_addr": "192.168.33.4",
        "node_name": "consul@192.168.33.4",
        "datacenter": "dc3"
      }
EOF
    SHELL
    server3.vm.provision "shell", inline: <<-SHELL
     service consul restart
     cp /vagrant/scripts/server3.sh /home/vagrant/demo.sh
     chmod 777 /home/vagrant/demo.sh
    SHELL
  end

  # provider
  config.vm.provider "virtualbox" do |vb|
    vb.memory = "1024"
    vb.cpus = 1
  end

end
