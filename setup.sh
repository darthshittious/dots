#!/bin/bash
curdir=$(dirname $(readlink -f $0))
cd curdir
editors() {
    sudo add-apt-repository ppa:kelleyk/emacs
    sudo apt update
    sudo apt install emacs27 nvim python3-venv python3-pip
    sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    git clone --depth 1 https://github.com/hlissner/doom-emacs ~/.emacs.d
    ~/.emacs.d/bin/doom install
    mkdir -p ~/.config/nvim
    cp .config/nvim/init.vim ~/.config/nvim/
}

piethon() {
    sudo add-apt-repository ppa:deadsnakes/ppa
    sudo apt update
    sudo apt install python3.9 python3.9-dev python3.9-venv python3-pip python3-venv
}

rust() {
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
}

shell_env() {
    cp ./{.zshrc,.zshenv,.zsh_aliases,.profile,.gitconfig} ~/
    [[ ! $(cat ~/.ssh/authorized_keys) == $(cat .ssh/authorized_keys) ]] && cat .ssh/authorized_keys >> ~/.ssh/authorized_keys
}

golang() {
    wget https://golang.org/dl/go1.17.3.linux-amd64.tar.gz
    sudo rm -rf /usr/local/go && sudo tar -C /usr/local -xzf go1.17.3.linux-amd64.tar.gz
    rm go1.17.3.linux-amd64.tar.gz
}

postgres() {
    sudo sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list'
    wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
    sudo apt update
    sudo apt install postgresql-14
}

dockerce() {
    sudo apt update
    sudo apt install ca-certificates curl gnupg lsb-release
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
    sudo apt update
    sudo apt install docker-ce docker-ce-cli containerd.io
    sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
    sudo chmod +x /usr/local/bin/docker-compose
    sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
}

essential() {
    sudo apt update
    sudo apt install bat cowsay build-essential
}

zshell() {
    sudo apt update
    sudo apt install zsh
    # omz
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    # powerlevel10k
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
    # completions
    git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/zsh-completions
    # autosuggestions
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
    # syntax highlighting
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
    shell_env
}


## EDIT BEFORE RUNNING AS NEEDED
editors
piethon
essential
zshell
rust
golang
postgres
dockerce
