#!/bin/bash

# cd ~/
# rm crewaiModels.sh
# wget -Nc https://raw.githubusercontent.com/harnalashok/test/refs/heads/main/crewaiModels.sh
# bash crewaiModels.sh

cd ~/   
echo "  "
echo "   "
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
