# -*- mode: ruby -*-
# vi: set ft=ruby :

ENV['VAGRANT_DEFAULT_PROVIDER'] = 'virtualbox'

Vagrant.configure("2") do |config|

  config.vm.box = "scotch/box"

  config.ssh.insert_key = false
  config.ssh.private_key_path = "~/.vagrant.d/insecure_private_key"

  config.vm.define "capistrano3demodeployone" do |one|
      one.vm.network "private_network", ip: "192.168.33.10", auto_correct: true
      one.vm.hostname = "capistrano3-demo-deploy-one.local"
  end

  config.vm.define "capistrano3demodeploytwo" do |two|
      two.vm.network "private_network", ip: "192.168.33.11", auto_correct: true
      two.vm.hostname = "capistrano3-demo-deploy-two.local"
  end

  #This next bit fixes the 'stdin is not a tty' error when shell provisioning Ubuntu boxes
  config.vm.provision :shell,
    #if there a line that only consists of 'mesg n' in /root/.profile, replace it with 'tty -s && mesg n'
    :inline => "(grep -q -E '^mesg n$' /root/.profile && sed -i 's/^mesg n$/tty -s \\&\\& mesg n/g' /root/.profile && echo 'Ignore the previous error about stdin not being a tty. Fixing it now...') || exit 0;"

  config.vm.provision "shell",
      inline: "sudo chown vagrant:vagrant /var/www/"

  config.vm.provision "shell",
      inline: "sudo sed -i -e 's@/var/www/public@/var/www/current/public@g' /etc/apache2/sites-enabled/000-default.conf"

  config.vm.provision "shell",
      inline: "sudo sed -i -e 's@www-data@vagrant@g' /etc/apache2/envvars"

end