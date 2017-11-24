* Install Debian 9.2.1 with GNOME and SSH
* Login as root
* Update your APT database with apt-get update;
* Install the latest security updates with apt-get upgrade;
* Install required packages with apt-get install build-essential module-assistant;
* Configure your system for building kernel modules by running m-a prepare;
* Click on Install Guest Additions... (Latest corrected by VirtualBox) from the Devices menu, then run mount /media/cdrom.
* Run sh /media/cdrom/VBoxLinuxAdditions.run, and follow the instructions on screen.

* apt-get -y install sudo
* adduser [user] sudo
* usermod -aG sudo [user]
* reboot

* run 'make install'