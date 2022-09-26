# -*- mode: ruby -*-
# vi: set ft=ruby :
BOX_IMAGE = 'ubuntu/jammy64'
GITURL = 'https://github.com/actions/runner/releases/download/v2.296.2/actions-runner-linux-x64-2.296.2.tar.gz'
HASH = '34a8f34956cdacd2156d4c658cce8dd54c5aef316a16bbbc95eb3ca4fd76429a'
ORGURL = 'https://github.com/devops-bc-01'
TOKEN = 'AQWL6OVDUXVKA33CB26L77TDFTDR4'

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
      "HASH" => HASH,
      "ORGURL" => ORGURL,
      "TOKEN" => TOKEN
    }
    # ciConfig.vm.provision "shell", inline: <<-SHELL
    #   apt-get update
      # mkdir -p actions-runner && cd actions-runner
      # curl -o actions-runner-linux-x64-2.296.2.tar.gz -L $GITURL
      # echo "$HASH  actions-runner-linux-x64-2.296.2.tar.gz" | shasum -a 256 -c
      # tar xzf ./actions-runner-linux-x64-2.296.2.tar.gz
      # ./config.sh --url $ORGURL --token $TOKEN
      # ./run.sh
    # SHELL
  end
end
