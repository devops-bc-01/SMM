# -*- mode: ruby -*-
# vi: set ft=ruby :
BOX_IMAGE = 'ubuntu/jammy64'
GITURL = 'https://github.com/actions/runner/releases/download/v2.296.2/actions-runner-linux-x64-2.296.2.tar.gz'

Vagrant.configure("2") do |config|
  config.vm.define "main" do |ciConfig|
    ciConfig.vm.box = BOX_IMAGE
    ciConfig.vm.hostname = 'dev-test'
    ciConfig.vm.network "forwarded_port", guest: 8081, host: 8001
    ciConfig.vm.network "forwarded_port", guest: 8082, host: 8002

    ciConfig.vm.provider :virtualbox do |vb|
      ciConfig.vm.network :private_network, ip: "10.20.1.10"
      vb.gui = false
      vb.memory = "1024"
      vb.cpus = "1"
    end

    config.vagrant.plugins = "vagrant-docker-compose"
    ciConfig.vm.provision :docker
    ciConfig.vm.provision :docker_compose
    #Scripts Provision
    ciConfig.vm.provision "shell", path: "runnerScript.sh", env: {
      "GITURL" => GITURL,
      "RUNNER_NAME" => "SergioMM"
    }
    
    ciConfig.vm.provision "shell", path: "dockerProvision.sh"
  end
end
# NODE_COUNT = 2
# Vagrant.configure("2") do |config|
#   (1..NODE_COUNT).each do |i|
#     config.vm.define "devops-#{i}" do |ciConfig|
#       ciConfig.vm.box = BOX_IMAGE
#       ciConfig.vm.hostname = 'dev-test'
#       ciConfig.vm.provider :virtualbox do |vb|
#         ciConfig.vm.network :private_network, ip: "10.20.1.1#{i}"
#         vb.gui = false
#         vb.memory = "1024"
#         vb.cpus = "1"
#       end
#       ciConfig.vm.network "forwarded_port", guest: 8080, host: 8080
#       ciConfig.vm.provision "shell", path: "runnerScript.sh", env: {
#         "GITURL" => GITURL,
#         "RUNNER_NAME" => "smm-runner-#{i}"
#       }
#     end
#   end
# end
