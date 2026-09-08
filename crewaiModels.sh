#!/bin/bash

# cd ~/
# rm crewaiModels.sh
# wget -Nc https://raw.githubusercontent.com/harnalashok/test/refs/heads/main/crewaiModels.sh
# bash crewaiModels.sh

## Install python3.13
# sudo add-apt-repository ppa:deadsnakes/ppa
# sudo apt update
## You need both the base package and the venv tool for 3.13
# sudo apt install python3.13 python3.13-venv



cd /home/$USER
echo "  "
echo "------------"                            
echo " Will install crewai"                     
echo "----------"                              
echo " "
cd /home/$USER
sleep 2
# 1. Switch to your home directory
cd ~/
curl -LsSf https://astral.sh/uv/install.sh | sh 
# 2. Compile to a local temp file (which uv deletes instantly anyway)
uv pip compile --system -o ~/temp_reqs.txt -q <(cat <<EOF
crewai
crewai-tools
crewai-cli
langchain
langchain-cli
langchain-openai
langchain-ollama
langchain-community
langchain-experimental
langchain-classic
yfinance
llama-index
llama-index-llms-groq
llama-index-core
llama-index-readers-file
llama-index-embeddings-huggingface
llama-index-experimental
pandas
newsapi-python
crewai[tools]
crewai-tools[mcp]
ddgs
duckduckgo-search
EOF
)

# 3. Clean up the placeholder file
#rm -f ~/temp_reqs.txt

uv tool install --force crewai

# Our project folder
rm -rf /home/$USER/crewai_pjt 
mkdir /home/$USER/crewai_pjt
# Make it writable by any program
chmod -R 777 /home/$USER/crewai_pjt
cd crewai_pjt
uv init
uv add crewai crewai-tools
# # c) Now install crewai and other packages using uv
uv add crewai crewai-tools crewai-cli langchain langchain-cli
uv add langchain-openai langchain-ollama langchain-community  
uv add langchain-experimental langchain-classic yfinance 
uv add llama-index llama-index-llms-groq llama-index-core
uv add llama-index-readers-file llama-index-embeddings-huggingface  
uv add llama-index llama-index-experimental pandas
uv add 'crewai[tools]'  newsapi-python
uv add 'crewai-tools[mcp]'
uv add ddgs duckduckgo-search
cd /home/$USER

# Create script to activate 'crewai_pjt' env
echo '#!/bin/bash'                                                         | tee     /home/$USER/activate_crewai_env.sh
echo "echo 'Execute this file as: source activate_crewai_env.sh' "         | tee -a  /home/$USER/activate_crewai_env.sh
echo "echo 'source /home/$USER/crewai_pjt/.venv/bin/activate' "            | tee -a  /home/$USER/activate_crewai_env.sh
echo "echo 'Or, as:               . activate_crewai_env.sh' "              | tee -a  /home/$USER/activate_crewai_env.sh
echo "echo '(Note the change in prompt after activating)' "                | tee -a  /home/$USER/activate_crewai_env.sh
echo "echo '(To deactivate, just enter the command: deactivate)' "         | tee -a  /home/$USER/activate_crewai_env.sh
echo "source /home/$USER/crewai_pjt/.venv/bin/activate"                    | tee -a  /home/$USER/activate_crewai_env.sh
echo "cd /home/$USER/crewai_pjt"                                           | tee -a  /home/$USER/activate_crewai_env.sh

###########

cd ~/   
echo "  "
echo "   "
cd /home/$USER
echo "Installing crewai Models"
sleep 3
rm -rf /home/$USER/Documents/crewaiModels
rm -rf /home/$USER/Documents/crewaiExamples
rm -rf /home/$USER/crewai_pjt

mkdir -p /home/$USER/Documents/crewaiExamples
mkdir -p /home/$USER/crewai_pjt

cd /home/$USER/Documents/crewaiExamples
git init
git remote add origin https://github.com/harnalashok/LLMs.git
git sparse-checkout init --cone
git sparse-checkout set crewaiModels
git pull origin main
find . -maxdepth 1 ! -name "crewaiModels" ! -name "." ! -name ".." -delete
cd /home/$USER/Documents
mkdir crewaiModels
cd crewaiModels
mv /home/$USER/Documents/crewaiExamples/crewaiModels/* .
rm -rf /home/$USER/Documents/crewaiExamples
cd /home/$USER
cp -r /home/$USER/Documents/crewaiModels/*  /home/$USER/crewai_pjt
mkdir /home/ashok/crewai_pjt/servers
cp /home/ashok/crewai_pjt/mcp_servers/'maths_stdio server'/maths_stdio_server.py /home/ashok/crewai_pjt/servers/
cp /home/ashok/crewai_pjt/mcp_servers/'maths_stdio server'/maths_stdio_client.py /home/ashok/crewai_pjt/





