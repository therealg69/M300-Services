Vagrant.configure("2") do |config|
	config.vm.define "web" do |web|
		
		web.vm.box = "ubuntu/xenial64"
		
		web.vm.hostname = "web"
		
		web.vm.network "private_network", ip: "10.0.0.3"
		
		web.vm.provider "virtualbox" do |vb|
			
			vb.memory = "512"
			
			vb.name = "web"
		
		end
		
		web.vm.synced_folder ".", "/vagrant"
		
		web.vm.provision "shell", path: "web.sh"
	end			

end
