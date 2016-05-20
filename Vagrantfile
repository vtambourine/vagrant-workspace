Vagrant.configure(2) do |config|
  config.vm.box = "debian/contrib-jessie64"
  # config.vm.box = "hashicorp/precise64"
  config.vm.box_check_update = false

  config.vm.synced_folder ".", "/vagrant"

  config.vm.provision :shell, path: "bootstrap.sh"

  # Forward PostgreSQL Server port
  config.vm.network :forwarded_port, guest: 5432, host: 15432

  config.vm.provider :virtualbox do |vb|
    vb.name = "winterfell"
end
end
