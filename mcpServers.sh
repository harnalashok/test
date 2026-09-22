#!/bin/bash

# LAst amended: 22nd Sep, 2026

## =========
# Replace existing mcp_servers folder in WSL ubuntu 
#  cd ~/
#  wget -Nc https://raw.githubusercontent.com/harnalashok/test/refs/heads/main/mcpServers.sh
#  chmod +x *.sh
#  bash mcpServers.sh
## =========

cd ~/
wget -Nc https://github.com/harnalashok/LLMs/blob/main/crewaiModels/mcpServer.zip?raw=true
mv mcpServer.zip\?raw\=true  mcpServer.zip
rm -rf /home/$USER/crewai_pjt/mcp_servers/*
mv mcpServer.zip /home/$USER/crewai_pjt/mcp_servers/
cd  /home/$USER/crewai_pjt/mcp_servers/
unzip mcpServer.zip
cd ~/
