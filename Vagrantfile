# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # All Vagrant configuration is done here. The most common configuration
  # options are documented and commented below. For a complete reference,
  # please see the online documentation at vagrantup.com.

  # Every Vagrant virtual environment requires a box to build off of.
  config.vm.box = "ubuntu-12.10-x64"

  # The url from where the 'config.vm.box' box will be fetched if it
  # doesn't already exist on the user's system.
  config.vm.box_url = "http://24-hetzner.berlinonline.de/boxes/ubuntu-12.10-x64.box"

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  config.vm.network :private_network, ip: "192.168.33.30"

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network :public_network

  # If true, then any SSH connections made will enable agent forwarding.
  # Default value: false
  config.ssh.forward_agent = true

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  # 
  # You need to have nfs installed on Your host machine to be able to use the type: "nfs" option
  config.vm.synced_folder "shared", "/home/vagrant/htdocs", type: "nfs"

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  config.vm.provider :virtualbox do |vb|
    # # Don't boot with headless mode
    # vb.gui = true

    # # Use UTC clock instead of host clock, see https://github.com/mitchellh/vagrant/issues/912
    # vb.customize ["modifyvm", :id, "--rtcuseutc", "on"]

    # 
    vb.customize ["setextradata", :id, "VBoxInternal2/SharedFoldersEnableSymlinksCreate/v-root", "1"]

    # # Use VBoxManage to customize the VM. For example to change memory:
    # vb.customize ["modifyvm", :id, "--memory", "1024"]
  end

  config.vm.host_name = "webserver.local.vm"

  # Enable provisioning with bash shell script
  config.vm.provision "shell", path: "provisioners/shell/init.sh"

  # Enable provisioning with Puppet stand alone.  Puppet manifests
  # are contained in a directory path relative to this Vagrantfile.
  config.vm.provision :puppet do |puppet|
    puppet.options = "--verbose --debug"

    puppet.manifests_path = "provisioners/puppet/manifests"
    puppet.module_path    = "provisioners/puppet/modules"
    puppet.manifest_file  = "site.pp"
  end
end
