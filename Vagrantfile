Vagrant.configure("2") do |config|
  config.vm.box       = "precise64"
  config.vm.box_url   = "http://files.vagrantup.com/precise64.box"

  config.vm.network :public_network

  config.vm.provision :shell, :inline => "sudo dpkg -i /vagrant/*.deb"

  config.vm.provider :virtualbox do |vb|
    # enable the gui.  the default behavior is to start up headless
    vb.gui = true
  end
end

