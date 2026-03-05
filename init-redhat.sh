#!/bin/bash
set -e

echo "=== RedHat/CentOS/Fedora System Initialization ==="

# Update package manager
echo "Updating package manager..."
sudo yum update -y || sudo dnf update -y

# Install ifconfig (part of net-tools)
echo "Installing net-tools (ifconfig)..."
sudo yum install net-tools -y || sudo dnf install net-tools -y

# Install netstat (part of net-tools)
echo "netstat installed with net-tools"

# Install docker
echo "Installing Docker..."
if command -v dnf &> /dev/null; then
    sudo dnf install docker -y
else
    sudo yum install docker -y
fi

# Enable and start docker service
echo "Enabling Docker service..."
sudo systemctl enable docker
sudo systemctl start docker

# Add current user to docker group
echo "Adding user to docker group..."
sudo usermod -aG docker $USER

# Install vim and dependencies
echo "Installing vim..."
sudo yum install vim -y || sudo dnf install vim -y

# Configure vim
echo "Configuring vim..."
mkdir -p ~/.vim/colors
cat > ~/.vimrc << 'EOF'
" Basic vim configuration
set number
set tabstop=4
set shiftwidth=4
set expandtab
set autoindent
set smartindent
set hlsearch
set incsearch
set ignorecase
set smartcase
set encoding=utf-8
set fileencoding=utf-8
syntax on
colorscheme default
EOF

echo "=== RedHat/CentOS/Fedora initialization complete ==="
echo "Please log out and log back in for docker group changes to take effect"