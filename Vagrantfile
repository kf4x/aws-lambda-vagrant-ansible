# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure(2) do |config|
    if Vagrant.has_plugin?("vagrant-vbguest")
        config.vbguest.auto_update = false
    end
    

    config.vm.define :vagrant do |ms_config|

        ms_config.vm.box = "ubuntu/trusty64"
        ms_config.vm.hostname = "nix"
        ms_config.vm.network :private_network, ip: "192.168.0.10"

        ms_config.vm.provider :virtualbox do |ms_vb|
            ms_vb.name = "lambda_nix"
            ms_vb.customize ["modifyvm", :id, "--memory", "512"]
            ms_vb.customize ["modifyvm", :id, "--cpus", "1"]
            ms_vb.customize ["modifyvm", :id, "--nictype1", "virtio"]
            ms_vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
            ms_vb.customize ["modifyvm", :id, "--natdnsproxy1", "on"]
        end

        ms_config.vm.provision :shell, :path => "scripts/setup.sh"
    end
    config.vm.synced_folder "src/", "/home/vagrant/app"
end


