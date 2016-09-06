Vagrant.configure(2) do |config|
  config.vm.box = "debian/contrib-jessie64"
  config.vm.box_check_update = false

  config.vm.synced_folder ".", "/vagrant"
  config.vm.synced_folder "~/Code", "/home/vagrant/code"

  config.vm.provision :shell, path: "bootstrap.sh"

  # Forward PostgreSQL Server port
  config.vm.network :forwarded_port, guest: 80, host: 8080
  config.vm.network :forwarded_port, guest: 5432, host: 15432
  config.vm.network :forwarded_port, guest: 3000, host: 13000

  config.vm.network :forwarded_port, guest: 8888, host: 18888

  config.vm.provider :virtualbox do |vb|
    vb.name = "winterfell"
  end
end
