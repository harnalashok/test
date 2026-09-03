!#/bin/bash

# cd ~/
# rm onlyllamaindexExamples.sh
# wget -Nc https://raw.githubusercontent.com/harnalashok/test/refs/heads/main/onlyllamaindexExamples.sh
# bash onlyllamaindexExamples.sh

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
