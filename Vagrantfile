# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/trusty64"
  config.vm.network "forwarded_port", guest: 80, host: 8080
  config.vm.network "private_network", ip: "192.168.56.242"

  config.vm.synced_folder "salt.States/", "/srv/states/"
  config.vm.synced_folder "Salt.Pillars/", "/srv/pillars/"

  config.vm.provision :salt do |salt|
    salt.minion_config = "etc/minion"
    salt.run_highstate = true
    salt.colorize = true
    salt.log_level = 'info'
  end
end
