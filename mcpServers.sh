#!/bin/bash

# LAst amended: 23rd Sep, 2026

## =========
# Replace existing mcp_servers folder in WSL ubuntu 
#  cd ~/
#  wget -Nc https://raw.githubusercontent.com/harnalashok/test/refs/heads/main/mcpServers.sh
#  chmod +x *.sh
#  bash mcpServers.sh
## =========

cd ~/
wget -Nc https://github.com/harnalashok/test/blob/main/mcpServers.zip?raw=true
mv 'mcpServers.zip?raw=true' mcpServers.zip
rm -rf /home/$USER/crewai_pjt/mcp_servers/*
mkdir -p /home/ashok/crewai_pjt/mcp_servers
mv mcpServers.zip /home/$USER/crewai_pjt/mcp_servers/
cd  /home/$USER/crewai_pjt/mcp_servers/
unzip mcpServers.zip
cd ~/
