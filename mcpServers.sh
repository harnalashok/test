#!/bin/bash

# LAst amended: 23rd Sep, 2026

## =========
# Replace existing mcp_servers folder in WSL ubuntu 
#  cd ~/
#  rm mcpServers.sh
#  wget -Nc https://raw.githubusercontent.com/harnalashok/test/refs/heads/main/mcpServers.sh
#  chmod +x *.sh
#  bash mcpServers.sh
## =========

cd ~/
#wget -Nc https://github.com/harnalashok/test/blob/main/mcpServers.zip?raw=true
wget -Nc https://github.com/harnalashok/test/blob/main/mcpServers.zip?raw=true
mv 'mcpServers.zip?raw=true' mcpServers.zip
rm -rf /home/$USER/crewai_pjt/mcp_servers/*
mkdir -p /home/ashok/crewai_pjt/mcp_servers
mv mcpServers.zip /home/$USER/crewai_pjt/mcp_servers/
cd  /home/$USER/crewai_pjt/mcp_servers/
unzip mcpServers.zip
cd ~/

cd ~/
 . activate_crewai_env.sh
uv add llama-index-llms-ollama
uv add llama-index-embeddings-ollama
cd /home/ashok/crewai_pjt/python_approach/CR1_files
mv 7a.sports_rag_analyst_intelli.py 7c.sports_rag_analyst_intelli.py
wget -Nc https://raw.githubusercontent.com/harnalashok/LLMs/refs/heads/main/crewaiModels/python_approach/CR1_files/7a.sports_rag_analyst_intelli.py
wget -Nc https://github.com/harnalashok/LLMs/blob/main/crewaiModels/Exercises/data/sports.pdf

