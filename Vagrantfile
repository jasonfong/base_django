# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version
VAGRANTFILE_API_VERSION = "2"

Vagrant.require_version ">= 1.5.0"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.hostname = "base-django"

  # Base box Ubuntu 14
  config.vm.box = "cloudimg-trusty64-20140904"
  config.vm.box_url = "http://cloud-images.ubuntu.com/vagrant/trusty/20140904/trusty-server-cloudimg-amd64-vagrant-disk1.box"

  # Port forwarding
  config.vm.network "forwarded_port", guest: 8080, host: 8080

  # SSH agent forwarding.
  config.ssh.forward_agent = true

  # VirtualBox config tweaks
  config.vm.provider "virtualbox" do |vb|
    # VirtualBox name
    vb.name = "base-django"

    # VM settings:
    vb.customize ["modifyvm", :id, "--ostype", "Ubuntu_64"]
    vb.customize ["modifyvm", :id, "--memory", "512"]
    vb.customize ["modifyvm", :id, "--cpus", "1"]
    vb.customize ["modifyvm", :id, "--acpi", "on"]
    vb.customize ["modifyvm", :id, "--ioapic", "on"]
    vb.customize ["modifyvm", :id, "--hwvirtex", "on"]
    vb.customize ["modifyvm", :id, "--pae", "on"]
  end

  # Enable Berkshelf integration
  # NOTE: cookbooks_path parameter will be ignored. Use Berksfile for additional Chef cookbooks.
  config.berkshelf.enabled = true

  # Set the version of chef to install using the vagrant-omnibus plugin
  config.omnibus.chef_version = :latest

  # Chef Solo provisioning
  config.vm.provision :chef_solo do |chef|
    chef.run_list = [
      "recipe[git]",
      "recipe[base_django::default]"
    ]
  end

end
