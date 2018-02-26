# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.ssh.insert_key = false
  config.vm.hostname = "virtualbox-clearos6"
  config.vm.box = "builds/virtualbox-clearos6.box"
  config.vm.box_url = "file://./builds/virtualbox-clearos6.box"

  config.vm.provider :virtualbox do |v|
    v.gui = false
    v.memory = 1024
    v.cpus = 1
    v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    v.customize ["modifyvm", :id, "--ioapic", "on"]
  end

  config.vm.provision "shell", inline: "echo Hello, World"

end
