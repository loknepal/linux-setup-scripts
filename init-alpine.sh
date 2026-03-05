#!/bin/bash
set -e

echo "=== Alpine Linux System Initialization ==="

# Update package manager
echo "Updating package manager..."
apk update
apk upgrade

# Install ifconfig (part of net-tools)
echo "Installing net-tools (ifconfig)..."
apk add net-tools

# Install netstat (part of net-tools)
echo "netstat installed with net-tools"

# Install docker
echo "Installing Docker..."
apk add docker
apk add docker-openrc

# Enable and start docker service
echo "Enabling Docker service..."
rc-service docker start
rc-update add docker

# Install vim and dependencies
echo "Installing vim..."
apk add vim

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

echo "=== Alpine Linux initialization complete ==="
echo "Please log out and log back in for docker group changes to take effect"