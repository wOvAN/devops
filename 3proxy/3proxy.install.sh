
install(){
    curl -L https://github.com/z3APA3A/3proxy/releases/download/0.9.3/3proxy-0.9.3.x86_64.deb \
	-o ./3proxy.x86_64.deb
    sudo apt install -y ./3proxy.x86_64.deb
}


start(){
    systemctl enable 3proxy
    systemctl start 3proxy
    systemctl status 3proxy
}

install
start