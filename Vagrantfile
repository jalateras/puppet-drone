# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "precise64"
  config.vm.network :private_network, ip: "192.168.10.10"

  config.vm.provision :puppet do |puppet|
    puppet.options = []
    puppet.module_path = [ "modules/contrib", "modules/custom" ]
    puppet.manifests_path = "manifests"
    puppet.manifest_file = "default.pp"
    puppet.options = "--verbose --debug"
  end
end
