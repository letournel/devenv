help:
	@echo "How to use:"
	@echo "	make install 		- install everything, use for bootstrap on nude distribution"

install:
	@echo "****************************"
	@echo "Start bootstrap installation"
	@echo "****************************"
	@echo ""
	@echo "  >> Install base packages"
	@sudo apt-get update
	@sudo apt-get install git htop vim curl wget tree tmux terminator software-properties-common dirmngr -y
	@echo ""
	@echo "  >> Install dotfiles"
	@if [ -d "`eval echo '~/dotfiles'`" ]; then git -C ~/dotfiles pull; else git clone https://github.com/letournel/dotfiles.git ~/dotfiles; fi
	@sh ~/dotfiles/setup.sh
	@echo ""
	@echo "  >> Install ansible package"
	@if ! grep -i "ansible" /etc/apt/sources.list; then echo "deb http://ppa.launchpad.net/ansible/ansible/ubuntu trusty main" | sudo tee -a /etc/apt/sources.list; fi
	@sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 93C4A3FD7BB9C367
	@sudo apt-get update
	@sudo apt-get install ansible -y
	@echo ""
	@echo "  >> Play ansible playbook"
	@ansible-playbook ~/devenv/playbook.yml -i ~/devenv/hosts
	@echo ""
	@echo "  >> Change user shell"
	@chsh -s /bin/zsh
	@echo ""
	@echo "  >> Add user to docker group"
	@sudo adduser letournel docker
	@echo ""
	@echo "Installation finished"
	@echo "Please run 'systemctl reboot'"
