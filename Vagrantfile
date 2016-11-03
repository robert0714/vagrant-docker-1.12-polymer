# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "ubuntu/trusty64"
  config.vm.synced_folder ".", "/vagrant"
  config.vm.provider "virtualbox" do |v|
    v.memory = 2048
  end
  config.vm.define :dev do |d|
    d.vm.network :forwarded_port, host: 8080, guest: 8080
    d.vm.network :forwarded_port, host: 8081, guest: 8081
    d.vm.network :forwarded_port, host: 8082, guest: 8082
#    d.vm.network "public_network", bridge: "eno4", ip: "192.168.57.35", auto_config: "false", netmask: "255.255.255.0" , gateway: "192.168.57.1"
#    default_router = "192.168.57.1"
#    d.vm.provision :shell, inline: "ip route delete default 2>&1 >/dev/null || true; ip route add default via #{default_router}"
    d.vm.provision :shell, inline: " timedatectl set-timezone Asia/Taipei "    
    d.vm.provision "shell", path: "bootstrap.sh"
    d.vm.provision :shell, inline: 'ansible-playbook /vagrant/ansible/dev.yml -c local -v'
    d.vm.hostname = "books-fe-polymer-dev"
  end
  if Vagrant.has_plugin?("vagrant-cachier")
    config.cache.scope = :box
  end
end
