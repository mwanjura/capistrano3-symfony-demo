# -*- mode: ruby -*-
# vi: set ft=ruby :

ENV['VAGRANT_DEFAULT_PROVIDER'] = 'virtualbox'

Vagrant.configure("2") do |config|

  config.vm.box = "scotch/box"

  config.ssh.insert_key = false
  config.ssh.private_key_path = "~/.vagrant.d/insecure_private_key"

  config.vm.define "capistrano3demo" do |c|
      c.vm.network "private_network", ip: "192.168.33.10"
      c.vm.hostname = "capistrano3-demo.local"
      c.vm.synced_folder ".", "/var/www", :mount_options => ["dmode=777", "fmode=666"]
  end

  config.vm.define "capistrano3demodeploy" do |c|
      c.vm.network "private_network", ip: "192.168.33.11"
      c.vm.hostname = "capistrano3-demo-deployed.local"
  end

end