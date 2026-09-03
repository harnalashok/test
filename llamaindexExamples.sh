#!/bin/bash

# cd ~/
# rm llamaindexExamples.sh
# wget -Nc https://raw.githubusercontent.com/harnalashok/test/refs/heads/main/llamaindexExamples.sh
# bash llamaindexExamples.sh

sudo sh -c 'echo "185.199.111.133 raw.githubusercontent.com" >> /etc/hosts'

#################
# langchain & langraph
#################
echo " "
echo " "
echo "--------"
echo "Installing langchain and langraph.."
echo "--------"
echo "   "
sleep 3
# Activate python environment at 'langchain'
#  for installing langchain and llama-index
##############
# Create python virtual env
##############
rm -rf /home/$USER/langchain
rm activate_langchain_venv.sh
python3 -m venv /home/$USER/langchain
source /home/$USER/langchain/bin/activate
# 1.6 Essentials software
pip install --upgrade pip
pip install spyder numpy scipy pandas matplotlib sympy cython
pip install jupyterlab
pip install ipython
pip install notebook
pip install streamlit
# Required for spyder:
echo $password | sudo -S apt install pyqt5-dev-tools -y
# Huggingface and llama.cpp related
pip install huggingface_hub
# To connect to postgresql
pip install psycopg2

# Create script to activate 'langchain' env
echo "echo 'To activate langchain+llamaIndex virtual envs, activate as:' "  > /home/$USER/activate_langchain_venv.sh
echo "echo '         source /home/$USER/langchain/bin/activate' "          >>  /home/$USER/activate_langchain_venv.sh
echo "echo 'Or, as:  . activate_langchain_env.sh' "                        >>  /home/$USER/activate_langchain_venv.sh
echo "echo '(Note the change in prompt after activating)' "                >>  /home/$USER/activate_langchain_venv.sh
echo "echo '(To deactivate, just enter the command: deactivate)' "         >>  /home/$USER/activate_langchain_venv.sh
echo "source /home/$USER/langchain/bin/activate"                           >>  /home/$USER/activate_langchain_venv.sh
echo "cd /home/$USER/lprojects"                                            >>  /home/$USER/activate_langchain_venv.sh

chmod +x /home/$USER/*.sh
sleep 2
cp /home/$USER/activate_langchain_venv.sh  /home/$USER/start/activate_langchain_venv.sh
cp /home/$USER/activate_langchain_venv.sh  /home/$USER/stop/activate_langchain_venv.sh
source /home/$USER/langchain/bin/activate
pip install langchain
pip install langchain-openai
pip install langchain-ollama
pip install langchain-community
pip install langchain-experimental
pip install langgraph
pip install "langserve[all]"
pip install langchain-cli
pip install unstructured
pip install unstructured[md]
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
pip install -U llama-index-vector-stores-postgres
# 1.3 Web access site
pip install tavily-python
# 1.4 Yahoo finance data
pip install yfinance
# 1.5 For groq, together, mistralAI access
pip install llama-index-llms-groq
pip install llama-index-llms-together
pip install llama-index-llms-mistralai
pip install llama-index-llms-openrouter
pip install  llama-index-experimental
pip install polars
chmod +x /home/$USER/*.sh
chmod +x /home/$USER/start/*.sh
chmod +x /home/$USER/stop/*.sh

#################

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
mkdir /home/$USER/lprojects/md_files_sample

cp /home/$USER/Documents/llamaindex/data/*.pdf                   /home/$USER/lprojects/pdf
cp /home/$USER/Documents/llamaindex/data/*.csv                   /home/$USER/lprojects/csv
cp -r /home/$USER/Documents/llamaindex/revised14042026/txt_files/*  /home/$USER/lprojects/txt_files/
cp /home/$USER/Documents/llamaindex/revised14042026/*            /home/$USER/lprojects/
cp /home/$USER/Documents/llamaindex/data/customers-100.csv	     /home/$USER/lprojects/
cp /home/$USER/Documents/llamaindex/data/md_files/*.md           /home/$USER/lprojects/md_files/
cp /home/$USER/Documents/llamaindex/postgresql/*.md              /home/$USER/lprojects/md_files1/
cp /home/$USER/Documents/llamaindex/postgresql/*.ipynb           /home/$USER/lprojects/pg
cp /home/$USER/Documents/llamaindex/postgresql_SQL/*.py          /home/$USER/lprojects/pg 
cd /home/$USER/lprojects/md_files/
cp SCorder1.md  Scorder2.md  SCorder4.md                         /home/$USER/lprojects/md_files_sample/
cd /home/$USER
  
  ############################33
