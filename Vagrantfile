# -*- mode: ruby -*-
# vi: set ft=ruby :

hosts = {
  "web1" => "192.168.33.10",
  "web2" => "192.168.33.11",
  "web3" => "192.168.33.12",
  "nginx" => "192.168.33.13",
  "haproxy" => "192.168.33.14",
  "db1" => "192.168.33.15",
  "db2" => "192.168.33.16",
  "ceph1" => "192.168.33.17",
  "ceph2" => "192.168.33.18",
  "ceph3" => "192.168.22.19"

}
Vagrant.configure("2") do |config|
  hosts.each do |name, ip|
    config.vm.define name do |machine|
      machine.vm.box = "ubuntu/trusty32"
      machine.vm.hostname = "%s.micro-hosting.local" % name
      machine.vm.network :private_network, ip: ip
      machine.vm.provider "virtualbox" do |v|
          v.name = name
          v.customize ["modifyvm", :id, "--memory", 200]
      end
    end
  end
end
