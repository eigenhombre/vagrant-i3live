# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant::Config.run do |config|
  # All Vagrant configuration is done here. The most common configuration
  # options are documented and commented below. For a complete reference,
  # please see the online documentation at vagrantup.com.

  # Every Vagrant virtual environment requires a box to build off of.
  config.vm.box = "scientificlinux-61"
  config.vm.forward_port 8000, 8000

  # The url from where the 'config.vm.box' box will be fetched if it
  # doesn't already exist on the user's system.
  config.vm.box_url = "http://vagrant.phys.uvic.ca/scientificlinux-61.box"

  # Boot with a GUI so you can see the screen. (Default is headless)
  # config.vm.boot_mode = :gui

  # Assign this VM to a host-only network IP, allowing you to access it
  # via the IP. Host-only networks can talk to the host machine as well as
  # any other machines on the same network, but cannot be accessed (through this
  # network interface) by any external networks.
  # config.vm.network :hostonly, "192.168.33.10"

  # Assign this VM to a bridged network, allowing you to connect directly to a
  # network using the host's network device. This makes the VM appear as another
  # physical device on your network.
  # config.vm.network :bridged

  # Share an additional folder to the guest VM. The first argument is
  # an identifier, the second is the path on the guest to mount the
  # folder, and the third is the path on the host to the actual folder.
  # config.vm.share_folder "v-data", "/vagrant_data", "../data"

  # Enable shell provisioner to install puppet
  config.vm.provision :shell, :path => "bash/install-puppet.sh"
  config.vm.provision :shell, :path => "bash/install-epel.sh"
  config.vm.provision :shell, :path => "bash/install-mongo.sh"
  # FIXME: kludge, this should probably be in Puppet:
  config.vm.provision :shell, :inline => "grep 'source ~/venv/bin/activate' .bashrc || (echo 'source ~/venv/bin/activate' >> .bashrc)"

  # Enable provisioning with Puppet stand alone.  Puppet manifests
  # are contained in a directory path relative to this Vagrantfile.
  # You will need to create the manifests directory and a manifest in
  # the file scientificlinux-61.pp in the manifests_path directory.
  #
  config.vm.provision :puppet do |puppet|
     puppet.manifests_path = "manifests"
     puppet.manifest_file  = "scientificlinux-61.pp"
     puppet.options        = "--verbose --debug"
  end
end
