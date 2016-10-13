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
    d.vm.network :forwarded_port, host: 3000, guest: 3000
    d.vm.network :forwarded_port, host: 3001, guest: 3001 
    d.vm.provision "shell", path: "bootstrap.sh"
    d.vm.provision :shell, inline: 'ansible-playbook /vagrant/ansible/dev.yml -c local -v'
    d.vm.hostname = "polymer-dev"
  end
  if Vagrant.has_plugin?("vagrant-cachier")
    config.cache.scope = :box
  end
end