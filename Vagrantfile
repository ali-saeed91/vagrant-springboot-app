# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.

# Environment and other variables
$NAME="petclinic"
$Email="robertfallon57288@gmail.com"
$JAVA_VERSION="11"

Vagrant.configure("2") do |config|

  config.vm.box = "centos/stream8"


  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  # NOTE: This will enable public access to the opened port

  config.vm.network "forwarded_port", guest: 8080, host: 8081
  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine and only allow access
  # via 127.0.0.1 to disable public access
  #config.vm.network "forwarded_port", guest: 80, host: 8080, host_ip: "127.0.0.1"


 config.vm.synced_folder "./shared", "/vagrant", type: "rsync"

  config.vm.provider "virtualbox" do |vb|
	vb.name = $NAME
    # Display the VirtualBox GUI when booting the machine
    vb.gui = true
	vb.memory = "4096"
    vb.cpus = "2"
	config.ssh.forward_agent = true
  end
  config.trigger.after :up do |trigger|
    trigger.name = "Hello world"
    trigger.info = "I am running after vagrant up!!"
  end
  
	 # Installing Packages
  config.vm.provision "shell", path: "./packages.sh"
 
end
