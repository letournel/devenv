letournel devenv
================

Prerequisites
-------------
* Install Debian 9.2.1 with GNOME and SSH

VirtualBox Integration (optional)
--------------------------------
* Click on "Install Guest Additions" from the "Devices" menu
* Choose the latest "Guest Additions image" corrected by VirtualBox if any
(see https://www.virtualbox.org/wiki/Downloads)
* Mount the device with:
````run mount /media/cdrom````
* Run:
````sh /media/cdrom/VBoxLinuxAdditions.run````
* Follow the instructions on screen

Manual steps
------------
* Login as root
* Update your APT database with:
````apt-get update````
* Install the latest security updates with:
````apt-get upgrade````
* Install required packages with:
````apt-get -y install build-essential module-assistant sudo````
* Configure your system for building kernel modules by running:
````m-a prepare````
* Add your user as sudoers:
````adduser [user] sudo && usermod -aG sudo [user]````
* Reboot

Install
-------
* Very simple, just run:
````make install````
