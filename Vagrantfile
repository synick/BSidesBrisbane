# -*- mode: ruby -*-
# vi: set ft=ruby :

# Series of challenges which can be switched between.
Labs = [
  "lab0",     # 0 <default>
  "lab1",     # 1
  "lab2",     # 2
  "lab3",     # 3
  "lab4",     # 4
  "lab5",     # 5
  "lab6",     # 6 
  "lab7",     # 7
  "lab8",     # 8
  "lab9",     # 9
]

Difficulty = [
  "Easy",     # 0 <default>
  "Hard",     # 1
]

ENV['rearm']

#Change these if you want a different lab or Difficulty
LabIndex = 0
DifficultyIndex = 0
  
  Vagrant.configure("2") do |config|
    config.vm.box = "synick/Windows7PrivEsc"
    config.vm.communicator = "winrm"
    config.winrm.username = "IEUser"
    config.winrm.password = "Passw0rd!"
    config.vm.guest = :windows
    config.windows.halt_timeout = 15
    config.windows.set_work_network = true
    config.vm.network :forwarded_port, guest: 3389, host: 3389, id: "rdp", auto_correct: true
    config.vm.network :forwarded_port, guest: 22, host: 2222, id: "ssh", auto_correct: true

    config.vm.provision "shell", path: "./labFiles/#{Labs[LabIndex]}/#{Labs[LabIndex]}.ps1"
    if DifficultyIndex == 1 
      config.vm.provision "shell", path: "./labfiles/enable-windows-defender.ps1"
    else
      config.vm.provision "shell", path: "./labfiles/disable-windows-defender.ps1"
      config.vm.provision "shell", path: "./labfiles/disable-UAC.ps1"
      #config.vm.provision "shell", path: "./labfiles/restart.ps1"
    end
    config.vm.provision "shell", inline: "del C:/tmp/\*"
    config.vm.provider "virtualbox" do |vb|
    # Display the VirtualBox GUI when booting the machine
    vb.gui = true

    # Customize the amount of memory on the VM:
    vb.memory = "2048"
    vb.customize ["modifyvm", :id, "--vram", "128"]
    vb.customize ["modifyvm", :id, "--natdnsproxy1", "on"]
    vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    vb.customize ['modifyvm', :id, '--clipboard', 'bidirectional']
    vb.customize ["modifyvm", :id, "--ioapic", "on"]
    vb.customize ["modifyvm", :id, "--audio", "none"]
    vb.customize ["modifyvm", :id, "--usb", "off"]
    vb.customize ["guestproperty", "set", :id, "/VirtualBox/GuestAdd/VBoxService/--timesync-set-threshold", 10000]
  end
end
