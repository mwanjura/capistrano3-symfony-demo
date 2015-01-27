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

  #This next bit fixes the 'stdin is not a tty' error when shell provisioning Ubuntu boxes
  config.vm.provision :shell,
    #if there a line that only consists of 'mesg n' in /root/.profile, replace it with 'tty -s && mesg n'
    :inline => "(grep -q -E '^mesg n$' /root/.profile && sed -i 's/^mesg n$/tty -s \\&\\& mesg n/g' /root/.profile && echo 'Ignore the previous error about stdin not being a tty. Fixing it now...') || exit 0;"

  config.vm.provision "shell",
      inline: "sudo chown vagrant:vagrant /var/www/"

end