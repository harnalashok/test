#!/bin/bash

# LAst amended: 27th Sep, 2026

## =========
# Replace existing mcp_servers folder in WSL ubuntu 
#  cd ~/
#  rm mcpServers.sh
#  wget -Nc https://raw.githubusercontent.com/harnalashok/test/refs/heads/main/mcpServers.sh
#  chmod +x *.sh
#  bash mcpServers.sh
## =========

rm -rf /home/$USER/crewai_pjt/mcp_servers
rm -rf /tmp/llms_sparse_tmp
mkdir -p /tmp/llms_sparse_tmp
cd /tmp/llms_sparse_tmp

git init
git remote add origin https://github.com/harnalashok/LLMs.git
git sparse-checkout init --cone
git sparse-checkout set crewaiModels/mcp_servers
git pull origin main

mkdir -p /home/$USER/crewai_pjt/mcp_servers
cp -r crewaiModels/mcp_servers/. /home/$USER/crewai_pjt/mcp_servers/

rm -rf /tmp/llms_sparse_tmp
read -p "Press [Enter] to continue..."
sleep 5

cd ~/
 . activate_crewai_env.sh
uv add llama-index-llms-ollama
uv add llama-index-embeddings-ollama
uv add "mcp[cli]" pandas-ta alpaca-py
uv add ollama
uv add fastmcp
cd /home/ashok/crewai_pjt/python_approach/CR1_files
mv 7a.sports_rag_analyst_intelli.py 7c.sports_rag_analyst_intelli.py
wget -Nc https://raw.githubusercontent.com/harnalashok/LLMs/refs/heads/main/crewaiModels/python_approach/CR1_files/7a.sports_rag_analyst_intelli.py
wget -Nc https://github.com/harnalashok/LLMs/blob/main/crewaiModels/Exercises/data/sports.pdf
if pdfinfo sports.pdf >/dev/null 2>&1; then
    echo "sports.pdf is valid"
else
    echo "sports.pdf is corrupted"
fi

cd ~/

