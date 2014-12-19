# Vagrantfile

VAGRANTFILE_API_VERSION = "2"
box = "ubuntu/trusty64"

machines = [
  {
    "hostname"=> "basestation",
    "ip"=> "192.168.123.4",
    "mem"=> 512,
    "cpu"=> 2,
    "ports"=> [ [80, 8081] ],
    "playbook"=> "basestations.yml"
  },
  {
    "hostname"=> "sensor1",
    "ip"=> "192.168.123.2",
    "mem"=> 512,
    "cpu"=> 2,
    "ports"=> [ [80, 8082] ],
    "playbook"=> "sensors.yml"
  },
  {
    "hostname"=> "user1",
    "ip"=> "192.168.123.3",
    "mem"=> 512,
    "cpu"=> 2,
    "ports"=> [],
    "playbook"=> "users.yml"
  }
]


Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  machines.each do |i|
    config.vm.define i["hostname"] do |machine|
      machine.vm.box = box
      machine.vm.host_name = i["hostname"]
      machine.vm.network :private_network, ip: i["ip"]

      i["ports"].each do |port|
        machine.vm.network :forwarded_port, guest: port[0], host: port[1]
      end

      machine.vm.provider :virtualbox do |vb|
        vb.customize [
          "modifyvm", :id,
          "--memory", i["mem"],
          "--cpus", i["cpu"],
          "--ioapic", "on",
        ]
      end

      machine.vm.provision "ansible" do |ansible|
    	ansible.playbook = i["playbook"]
    	ansible.inventory_path = "hosts"
    	ansible.verbose = "vvvv"
    	ansible.host_key_checking = false
    	ansible.limit = "local"
      end
    end
  end
end
