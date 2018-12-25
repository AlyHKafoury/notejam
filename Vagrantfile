Vagrant.configure("2") do |config|
  config.vm.provider "virtualbox" do |v|
    v.memory = 2048
    v.cpus = 2
  end
  
  config.vm.define "master" do |master|
    master.vm.box = "bento/ubuntu-18.04"
    master.vm.network "private_network", ip: "10.0.1.2"
    master.vm.provision "ansible" do |ansible|
      ansible.playbook = "ansible/master.yml"
      ansible.extra_vars = { node_name: "master" }
    end
  end

  nodes = [{id: 1, ip: "10.0.1.3"},{ id: 2, ip: "10.0.1.4"}] 

  nodes.each do |node_info| 
    config.vm.define "node#{node_info[:id]}" do |node|
      node.vm.box = "bento/ubuntu-18.04"
      node.vm.network "private_network", ip: "#{node_info[:ip]}"
      node.vm.provision "ansible" do |ansible|
        ansible.playbook = "ansible/node.yml"
        ansible.extra_vars = { node_name: "node#{node_info[:id]}" }
      end
    end
  end
end
