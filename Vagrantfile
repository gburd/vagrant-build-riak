# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = '2'

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = 'ubuntu/trusty64'
  config.vm.hostname = 'riak-2x-ext'
  config.vm.network(:private_network, :ip => '192.168.56.40')

  config.vm.define "riak" do |vm|
  end

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  config.vm.network :forwarded_port, guest: 8087, host: 27017     # protobuff
  config.vm.network :forwarded_port, guest: 8098, host: 27018     # http

  config.vm.provider :libvirt do |domain|
    domain.memory = 2048
    domain.cpus = 4
    domain.machine_type = 'pc'
    domain.machine_arch = 'x86_64'
  end

  riak_major_version = 2
  riak_minor_version = 1
  riak_patch_version = 3
  riak_simple_version = riak_major_version.to_s + "." + riak_minor_version.to_s
  riak_full_version = riak_major_version.to_s + "." + riak_minor_version.to_s + "." + riak_patch_version.to_s

  _version = "otp_src_R16B02-basho8"

  numnodes = 1

  client_major_version = 2
  client_minor_version = 1
  client_patch_version = 3
  client_full_version = client_major_version.to_s + "." + client_minor_version.to_s + "." + client_patch_version.to_s

  config.vm.provision(:shell, path: 'env_deps.sh', args: "#{riak_full_version}")
  config.vm.provision(:shell, path: 'build_erl.sh', args: "#{_version}", privileged: false)
  config.vm.provision(:shell, path: 'inst_erl.sh', args: "#{_version}")
  config.vm.provision(:shell, path: 'riak.sh', args: "#{riak_simple_version} #{riak_full_version} #{numnodes.to_s} #{client_full_version}", privileged: false)
end
