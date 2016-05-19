Vagrant.configure(2) do |config|
  config.vm.box = "debian/contrib-jessie64"
  # config.vm.box = "hashicorp/precise64"
  config.vm.box_check_update = false

  config.vm.synced_folder ".", "/vagrant"

  config.vm.provision :shell, path: "bootstrap.sh"
end
