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
  "ceph3" => "192.168.33.19",
  "consul" => "192.168.33.20"

}
Vagrant.configure("2") do |config|
  hosts.each do |name, ip|
    config.vm.define name do |machine|
      machine.vm.box = "ubuntu/bionic64"
      machine.vm.hostname = "%s.microhosting.local" % name
      ssh_pub_key = File.readlines("#{Dir.home}/.ssh/id_rsa.pub").first.strip
      config.vm.provision 'shell', inline: 'mkdir -p /root/.ssh'
      config.vm.provision 'shell', inline: "echo #{ssh_pub_key} >> /root/.ssh/authorized_keys"
      config.vm.provision 'shell', inline: "echo #{ssh_pub_key} >> /home/vagrant/.ssh/authorized_keys", privileged: false

      machine.vm.network :private_network, ip: ip
      machine.vm.provider "virtualbox" do |v|
          v.name = name
          v.customize ["modifyvm", :id, "--memory", 400]
      end
    end
  end
end
