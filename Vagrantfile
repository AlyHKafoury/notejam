Vagrant.configure("2") do |config|
  
  config.vm.provider "virtualbox" do |v|
    v.memory = 2048
    v.cpus = 1
  end
  
  config.vm.define "master" do |master|
    master.vm.box = "bento/ubuntu-18.04"
    master.vm.network "private_network", ip: "10.0.0.2"
  end
  
  config.vm.define "node1" do |node1|
    node1.vm.box = "bento/ubuntu-18.04"
    node1.vm.network "private_network", ip: "10.0.0.3"
  end
  
  config.vm.define "node2" do |node2|
    node2.vm.box = "bento/ubuntu-18.04"
    node2.vm.network "private_network", ip: "10.0.0.4"
  end
  
end
