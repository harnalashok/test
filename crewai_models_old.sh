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



##########
echo "  "
echo "------------"                            
echo " Will install crewai"                     
echo "----------"                              
echo " "
cd /home/$USER
sleep 2

# Our project folder
mkdir /home/$USER/crewai_pjt
# Make it writable by any program
chmod -R 777 /home/$USER/crewai_pjt

# Delete existing env
rm -rf /home/$USER/crewai_env
python3.13 -m venv crewai_env
# b) Activate the env
source /home/$USER/crewai_env/bin/activate

# c) Now install crewai and other packages using uv
uv pip install crewai crewai-tools crewai-cli langchain langchain-cli
uv pip install langchain-openai langchain-ollama langchain-community  
uv pip install langchain-experimental langchain-classic yfinance 
uv pip install llama-index llama-index-llms-groq llama-index-core
uv pip install llama-index-readers-file llama-index-embeddings-huggingface  
uv pip install llama-index llama-index-experimental pandas
uv pip install 'crewai[tools]'  newsapi-python
uv pip install 'crewai-tools[mcp]'
deactivate

# Create script to activate 'crewai_env' env
echo '#!/bin/bash'                                                         | tee     /home/$USER/activate_crewai_env.sh
echo "echo 'Execute this file as: source activate_crewai_env.sh' "         | tee -a  /home/$USER/activate_crewai_env.sh
echo "echo 'source /home/$USER/crewai_env/bin/activate' "                  | tee -a  /home/$USER/activate_crewai_env.sh
echo "echo 'Or, as:               . activate_crewai_env.sh' "              | tee -a  /home/$USER/activate_crewai_env.sh
echo "echo '(Note the change in prompt after activating)' "                | tee -a  /home/$USER/activate_crewai_env.sh
echo "echo '(To deactivate, just enter the command: deactivate)' "         | tee -a  /home/$USER/activate_crewai_env.sh
echo "source /home/$USER/crewai_env/bin/activate"                          | tee -a  /home/$USER/activate_crewai_env.sh
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
