qemu_guest_agent_install(){
    if [ -n "$(command -v "dnf")" ]; then
	dnf install -y \
	    qemu-guest-agent
    elif   [ -n "$(command -v "yum")" ]; then
	yum install -y \
	    qemu-guest-agent
    elif [ -n "$(command -v "apt")" ]; then
	apt install -y \
	    qemu-guest-agent
    else
	echo "No supported package manager foound."
    fi
    systemctl enable qemu-guest-agent
    systemctl start qemu-guest-agent
    systemctl status qemu-guest-agent
}

qemu_guest_agent_run(){
    systemctl enable qemu-guest-agent
    systemctl start qemu-guest-agent
    systemctl status qemu-guest-agent
}

qemu_guest_agent_install
qemu_guest_agent_run

