
setup:
	vagrant plugin install vagrant-libvirt
	vagrant plugin install vagrant-mutate
	vagrant plugin install vagrant-rekey-ssh
	vagrant box add ubuntu/trusty64 https://vagrantcloud.com/ubuntu/boxes/trusty64/versions/14.04/providers/virtualbox.box
	vagrant mutate ubuntu/trusty64 libvirt

kill:
	vagrant halt riak
	vagrant destroy riak

all:
	vagrant up --provider=libvirt


