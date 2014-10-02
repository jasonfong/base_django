base_django
===========

Vagrant setup for skeleton Django project


VM Setup
========
Requirements:

1. [VirtualBox](https://www.virtualbox.org/wiki/Downloads)
2. [Vagrant](http://www.vagrantup.com/downloads.html)
3. [Chef Development Kit](http://downloads.getchef.com/chef-dk)

Install Vagrant Plugins:

        vagrant plugin install vagrant-omnibus
        vagrant plugin install vagrant-berkshelf
        
Clone repo and initialize VM:

        git clone https://github.com/jasonfong/base_django.git
        vagrant up
        
The development VM should now be functional.

Files in the local copy of this repo are shared into the /vagrant directory inside the VM.

Django server should be available here:

[http://localhost:8080](http://localhost:8080)

Shutdown the VM:

        vagrant halt
        
Start the VM:

        vagrant up
