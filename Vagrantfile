# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  config.ssh.insert_key = true
  config.vbguest.auto_update = true

  config.vm.define :mgmt do |mgmt_config|
    mgmt_config.vm.box = "ubuntu/trusty64"
    mgmt_config.vm.hostname = "mgmt"
    mgmt_config.vm.network "private_network", ip: "192.168.56.10"
    mgmt_config.vm.provider "virtualbox" do |vb|
      vb.name = "mgmt"
      opts = ['modifyvm', :id, '--natdnshostresolver1', 'on']
      vb.customize opts
      vb.memory = "256"
    end
    mgmt_config.vm.provision "shell", path: "bootstrap-mgmt.sh"
  end

# create box to install open day light in
  config.vm.define :opendaylight do |config|
      config.vm.box = "ubuntu/trusty64"
      config.vm.hostname = "opendaylight"
      config.vm.network :private_network, ip: "192.168.56.11"
      config.vm.provider "virtualbox" do |vb|
        vb.name = "opendaylight"
        opts = ["modifyvm", :id, "--natdnshostresolver1", "on"]
        vb.customize opts
        vb.memory = "2048"
      end
  end

# Always use Vagrant's default insecure key
  config.ssh.insert_key = false
# Always use X11 Forwarding with r+this machine
  config.ssh.forward_x11 = true
# To avoid/allow install and uninstall of VBoxGuessAdditions.
  config.vbguest.auto_update = false  
# Disable/enable automatic box update checking.
  config.vm.box_check_update = false  



# Assign a friendly name for vagrant STATUS
  config.vm.define "mininet" do |mininet_config|
  # Every Vagrant development environment requires a box.
  mininet_config.vm.box = "ktr/mininet"
  # Assign a friendly name to this host VM
  mininet_config.vm.hostname = "mininet"
  # Create a private network, which allows host-only access to the machine
  mininet_config.vm.network "private_network", ip: "192.168.56.12"
  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant.
  # Example for VirtualBox:
    mininet_config.vm.provider "virtualbox" do |vb|
    # Change the VM name/ID in the Hypervisor
      vb.name = 'mininet'
      opts = ['modifyvm', :id, '--natdnshostresolver1', 'on']
      vb.customize opts
    end
  end

# Some shell provisioning when machine is launched
 config.vm.provision :shell, :inline => "apt-get update --fix-missing"

end