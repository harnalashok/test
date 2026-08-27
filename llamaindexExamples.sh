#!/bin/bash

# wget -Nc https://raw.githubusercontent.com/harnalashok/test/refs/heads/main/llamaindexExamples.sh
# bash llamaindexExamples.sh

cd ~/   
echo "  "
echo "   "
echo "Installing llamaindexExamples"
sleep 3
rm -rf /home/$USER/Documents/llamaindex
rm -rf /home/$USER/Documents/llamaindexExamples
mkdir -p /home/$USER/Documents/llamaindexExamples
cd /home/$USER/Documents/llamaindexExamples
git init
git remote add origin https://github.com/harnalashok/LLMs.git
git sparse-checkout init --cone
git sparse-checkout set llamaindex
git pull origin main
find . -maxdepth 1 ! -name "llamaindex" ! -name "." ! -name ".." -delete
cd /home/$USER/Documents
mkdir llamaindex
cd llamaindex
mv /home/$USER/Documents/llamaindexExamples/llamaindex/* .
rm -rf /home/$USER/Documents/llamaindexExamples
cd /home/$USER
echo "Populating lprojects"
rm -rf /home/$USER/lprojects
mkdir /home/$USER/lprojects
mkdir /home/$USER/lprojects/txt_files
mkdir /home/$USER/lprojects/md_files
mkdir /home/$USER/lprojects/md_files1
mkdir /home/$USER/lprojects/pg
mkdir /home/$USER/lprojects/pdf
mkdir /home/$USER/lprojects/csv
cp /home/$USER/Documents/llamaindex/data/*.pdf                   /home/$USER/lprojects/pdf
cp /home/$USER/Documents/llamaindex/data/*.csv                   /home/$USER/lprojects/csv
cp -r /home/$USER/Documents/llamaindex/revised14042026/txt_files/*  /home/$USER/lprojects/txt_files/
cp /home/$USER/Documents/llamaindex/revised14042026/*            /home/$USER/lprojects/
cp /home/$USER/Documents/llamaindex/data/customers-100.csv	     /home/$USER/lprojects/
cp /home/$USER/Documents/llamaindex/data/md_files/*.md           /home/$USER/lprojects/md_files/
cp /home/$USER/Documents/llamaindex/postgresql/*.md              /home/$USER/lprojects/md_files1/
cp /home/$USER/Documents/llamaindex/postgresql/*.ipynb           /home/$USER/lprojects/pg
cp /home/$USER/Documents/llamaindex/postgresql_SQL/*.py          /home/$USER/lprojects/pg 
#rm -rf /home/$USER/lprojects
#mkdir -p /home/$USER/lprojects/md_files
#cp /home/$USER/Documents/llamaindex/revised14042026/*.pdf    /home/$USER/lprojects
#cp /home/$USER/Documents/llamaindex/revised14042026/*.csv    /home/$USER/lprojects
#cp /home/$USER/Documents/llamaindex/revised14042026/*.ipynb  /home/$USER/lprojects
#cp /home/$USER/Documents/llamaindex/data/md_files/*.md       /home/$USER/lprojects/md_files

#======= langchain install =====================
# pip install --upgrade pip
pip install spyder numpy scipy pandas matplotlib sympy cython
pip install jupyterlab
pip install ipython
pip install notebook
pip install streamlit
# To connect to postgresql
pip install psycopg2
# Required for spyder:
echo $password | sudo -S apt install pyqt5-dev-tools -y
# Huggingface and llama.cpp related
pip install huggingface_hub
# Create script to activate 'langchain' env
echo "echo 'To activate langchain+llamaIndex virtual envs, activate as:' "  > /home/$USER/activate_langchain_venv.sh
echo "echo 'source /home/$USER/langchain/bin/activate' "                   >>  /home/$USER/activate_langchain_venv.sh
echo "echo '(Note the change in prompt after activating)' "                >>  /home/$USER/activate_langchain_venv.sh
echo "echo '(To deactivate, just enter the command: deactivate)' "         >>  /home/$USER/activate_langchain_venv.sh
echo "source /home/$USER/langchain/bin/activate"                           >>  /home/$USER/activate_langchain_venv.sh
chmod +x /home/$USER/*.sh
sleep 2
cp /home/$USER/activate_langchain_venv.sh  /home/$USER/start/activate_langchain_venv.sh
cp /home/$USER/activate_langchain_venv.sh  /home/$USER/stop/activate_langchain_venv.sh
source /home/$USER/langchain/bin/activate
pip install langchain
pip install langchain-openai
pip install langchain-community
pip install langchain-experimental
pip install langgraph
pip install "langserve[all]"
pip install langchain-cli
pip install llama-index llama-index-experimental pandas
#################
# llamaindex
# To be installed ONLY in langchain virtual env
#################
# 1.0 LLamaindex install
# Mostly openai related
echo "Installing llama-index"
echo "  "
pip install llama-index
# 1,1 Ollama, huggingface and localai (openailike) oriented
pip install --upgrade transformers
pip install llama-index-core llama-index-readers-file llama-index-llms-ollama llama-index-embeddings-ollama llama-index-embeddings-huggingface llama-index-llms-openai-like llama-index-vector-stores-faiss 
pip install llama-index-readers-file llama-index-embeddings-fastembed
# Needed inspite of code repeated above
pip install --upgrade transformers
# 1.2 Vector stores
pip install faiss-cpu
pip install qdrant-client llama-index-vector-stores-chroma 
pip install llama-index-vector-stores-qdrant fastembed
# 1.3 Web access site
pip install tavily-python
# 1.4 Yahoo finance data
pip install yfinance
# 1.5 For groq, together, mistralAI access
pip install llama-index-llms-groq
pip install llama-index-llms-together
pip install llama-index-llms-mistralai
pip install  llama-index-experimental
pip install polars
# Download llamaindex tutorials
mkdir -p /home/$USER/Documents/llamaindex
cd /home/$USER/Documents/llamaindex
wget -nc https://raw.githubusercontent.com/harnalashok/LLMs/refs/heads/main/llamaindex/llamaindex_fundamentals.ipynb
wget -c https://raw.githubusercontent.com/harnalashok/LLMs/refs/heads/main/llamaindex/1_basic_agent.py
wget -nc https://raw.githubusercontent.com/harnalashok/LLMs/refs/heads/main/llamaindex/L0_simple_csv_moodle-expt.ipynb
wget -nc https://raw.githubusercontent.com/harnalashok/LLMs/refs/heads/main/llamaindex/L0_simple_skill_gap.ipynb
wget -nc https://raw.githubusercontent.com/harnalashok/LLMs/refs/heads/main/llamaindex/L1_Router_Engine.ipynb
wget -nc https://raw.githubusercontent.com/harnalashok/LLMs/refs/heads/main/llamaindex/L2_Tool_Calling.ipynb
wget -nc https://raw.githubusercontent.com/harnalashok/LLMs/refs/heads/main/llamaindex/L3_Building_an_Agent_Reasoning_Loop.ipynb
wget -nc https://raw.githubusercontent.com/harnalashok/LLMs/refs/heads/main/llamaindex/L4_Building_a_Multi-Document_Agent.ipynb
echo "langchain_installed.txt" > /home/$USER/langchain_installed.txt
chmod +x /home/$USER/*.sh
chmod +x /home/$USER/start/*.sh
chmod +x /home/$USER/stop/*.sh
cd /home/$USER
deactivate
