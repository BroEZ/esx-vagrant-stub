Vagrant.configure("2") do |config|
  config.vm.box = "vsphere-dummy"

  config.vm.provider :vsphere do |vsphere|
    # The vSphere host we're going to connect to
    vsphere.host = '172.31.254.249'

   # The ESX host for the new VM
    vsphere.compute_resource_name = '172.31.254.250'

    # The resource pool for the new VM
    vsphere.resource_pool_name = 'DEV'

    # The template we're going to clone
    vsphere.template_name = 'centos7_minimal_vagrant'

    # The name of the new machine
    vsphere.name = 'centos7.mynewbox'

    # vSphere login
    vsphere.user = 'administrator@broez.esx'

    # vSphere password
    vsphere.password = '*************'

    # If you don't have SSL configured correctly, set this to 'true'
    vsphere.insecure = true
  end
 
  config.vm.provision "shell", inline: <<-SHELL
     # My 'hello world' of provisioning examples
     /usr/bin/echo "$(date)" >> /tmp/SHELL_WORKED

     # Install the EPEL repo
     rpm -Uvh http://download.fedoraproject.org/pub/epel/7/x86_64/e/epel-release-7-5.noarch.rpm
     # Build the yum cache after adding EPEL
     yum makecache fast

     # If you're doing more than shell provisioning, you only want one of the following, 
     # unless you're a sick puppy that runs multiple CM systems.
     # Alternately, you could build your base box with your CM of choice baked in. (Better idea.)
     # Option 1 - Install Puppet from EPEL
     yum install puppet -y
     # Option 2 - Install Chef
     rpm -Uvh https://opscode-omnibus-packages.s3.amazonaws.com/el/6/x86_64/chef-12.3.0-1.el6.x86_64.rpm
SHELL

  config.vm.provision :puppet do |puppet|
    puppet.manifests_path = "puppet/manifests"
    puppet.manifest_file = "site.pp"
    puppet.module_path = "puppet/modules"
  end

  config.vm.provision "chef_solo" do |chef|
    chef.cookbooks_path = "cookbooks" # path to your cookbooks
    chef.add_recipe "chef_test"
  end

end
