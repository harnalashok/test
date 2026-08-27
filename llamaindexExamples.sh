#!/bin/bash
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
rm -rf /home/$USER/lprojects
mkdir -p /home/$USER/lprojects/md_files
cp /home/$USER/Documents/llamaindex/revised14042026/*.pdf    /home/$USER/lprojects
cp /home/$USER/Documents/llamaindex/revised14042026/*.csv    /home/$USER/lprojects
cp /home/$USER/Documents/llamaindex/revised14042026/*.ipynb  /home/$USER/lprojects
cp /home/$USER/Documents/llamaindex/data/md_files/*.md       /home/$USER/lprojects/md_files
