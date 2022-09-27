# -*- mode: ruby -*-
# vi: set ft=ruby :
BOX_IMAGE = 'ubuntu/jammy64'
GITURL = 'https://github.com/actions/runner/releases/download/v2.296.2/actions-runner-linux-x64-2.296.2.tar.gz'

Vagrant.configure("2") do |config|
  config.vm.define "main" do |ciConfig|
    ciConfig.vm.box = BOX_IMAGE
    ciConfig.vm.hostname = 'dev-test'
    ciConfig.vm.provider :virtualbox do |vb|
      ciConfig.vm.network :private_network, ip: "10.20.1.10"
      vb.gui = false
      vb.memory = "1024"
      vb.cpus = "1"
    end
    ciConfig.vm.network "forwarded_port", guest: 8080, host: 8080
    ciConfig.vm.provision "shell", path: "runnerScript.sh", env: {
      "GITURL" => GITURL,
    }
  end
end
