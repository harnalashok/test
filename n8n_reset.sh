#!/bin/bash

# Last amended: 20/08/2026
# Execute the script as below:
# cd ~/
# wget https://raw.githubusercontent.com/harnalashok/test/refs/heads/main/n8n_reset.sh
# bash n8n_reset.sh


IP_ADDRESS=$(hostname -I | awk '{print $1}')
# Fallback mechanism if hostname -I returns empty (common on macOS or minimal Linux)
if [ -z "$IP_ADDRESS" ]; then
	IP_ADDRESS=$(ip route get 1 // | awk '{print $7}')
fi
# Print the detected IP for visibility
echo "Detected Local IP Address: $IP_ADDRESS"

# Reset n8n password script
echo '#!/bin/bash'                                          >  /home/$USER/reset_n8n.sh
echo " "                                                   >> /home/$USER/reset_n8n.sh
echo "docker exec -it n8n n8n user-management:reset"       >> /home/$USER/reset_n8n.sh
echo "sleep 3"                                             >> /home/$USER/reset_n8n.sh
echo "netstat -aunt | grep 5678"                           >> /home/$USER/reset_n8n.sh
echo "echo '==**====**====='"                              >> /home/$USER/reset_n8n.sh
echo "echo 'For uniformity, keep details as follows:'"     >> /home/$USER/reset_n8n.sh
echo "echo '   email:       ashok@fsm.ac.in'"              >> /home/$USER/reset_n8n.sh
echo "echo '   First Name:  ashok'"                        >> /home/$USER/reset_n8n.sh
echo "echo '   Last Name:   harnal'"                       >> /home/$USER/reset_n8n.sh
echo "echo '   password:   Ashok@12345'"                   >> /home/$USER/reset_n8n.sh
echo "echo '==**====**====='"                              >> /home/$USER/reset_n8n.sh

password="ashok"
IP_ADDRESS=$(hostname -I | awk '{print $1}')
# n8n start script for Ubuntu
echo '#!/bin/bash'                                                                                                        > /home/$USER/start_n8n.sh
echo " "                                                                                                                  >> /home/$USER/start_n8n.sh
echo "IP_ADDRESS=\$(hostname -I | awk '{print \$1}')"                                                                     >> /home/$USER/start_n8n.sh        
echo "echo '1. Access n8n at port 5678. Wait...starting...'"                                                              >> /home/$USER/start_n8n.sh
echo "echo '2. Update n8n as:            ./update_n8n.sh'"                                                                >> /home/$USER/start_n8n.sh
echo "echo '3. Stop n8n as:              docker stop n8n'"                                                                >> /home/$USER/start_n8n.sh
echo "echo '4. Delete all workflows as:  sudo rm -rf .n8n/ '"                                                             >> /home/$USER/start_n8n.sh
echo "echo '5. Reset n8n login:          ./reset_n8n.sh'"                                                                 >> /home/$USER/start_n8n.sh
echo "echo '6. Memory usage: Use \"top -u $USER\" OR \"free -g \" '"                                                      >>  /home/$USER/start_n8n.sh
echo "sleep 4"                                                                                                             >> /home/$USER/start_n8n.sh
echo "docker run -it -d --rm --name n8n -p 5678:5678 -e WEBHOOK_URL=\"http://$IP_ADDRESS:5678/\" -e NODE_OPTIONS=\"--max-old-space-size=4096\" --network host -v /home/ashok/.n8n:/home/node/.n8n docker.n8n.io/n8nio/n8n"   >> /home/$USER/start_n8n.sh
echo "echo '  '"                                              >> /home/$USER/start_n8n.sh
echo "echo '======NOTE==='"                                   >> /home/$USER/start_n8n.sh
echo "echo 'if n8n does not get started, issue command:'"     >> /home/$USER/start_n8n.sh
echo "echo '     sudo chown -R 1000:1000 /home/$USER/.n8n'"   >> /home/$USER/start_n8n.sh
echo "echo ' And restart n8n using this very command'"        >> /home/$USER/start_n8n.sh
echo "echo '======NOTE==='"                                   >> /home/$USER/start_n8n.sh
echo "echo 'n8n version is'"                                  >> /home/$USER/start_n8n.sh
echo "docker exec -it n8n n8n --version"  		      >> /home/$USER/start_n8n.sh
echo "echo \"\"\${IP_ADDRESS}\"\""                            >> /home/$USER/start_n8n.sh
echo "sleep 3"                                                >> /home/$USER/start_n8n.sh
echo "netstat -aunt | grep 5678"                              >> /home/$USER/start_n8n.sh	

# Hard Reset n8n password
echo '#!/bin/bash'                                          > /home/$USER/hard_reset_n8n.sh
echo " "                                                   >> /home/$USER/hard_reset_n8n.sh
echo "echo 'Stopping n8n, if started'"                     >> /home/$USER/hard_reset_n8n.sh
echo "docker stop n8n"                                     >> /home/$USER/hard_reset_n8n.sh
echo "sleep 3"                                             >> /home/$USER/hard_reset_n8n.sh
echo "sudo rm -rf /home/$USER/.n8n"			   >> /home/$USER/hard_reset_n8n.sh
echo "echo 'Restarting n8n'"                               >> /home/$USER/hard_reset_n8n.sh
echo "bash start_n8n.sh"                                   >> /home/$USER/hard_reset_n8n.sh
echo "sleep 3"                                             >> /home/$USER/hard_reset_n8n.sh
echo "sudo chown -R 1000:1000 /home/$USER/.n8n"            >> /home/$USER/hard_reset_n8n.sh
echo "echo 'Done...'"                                      >> /home/$USER/hard_reset_n8n.sh
echo "sleep 3"                                             >> /home/$USER/hard_reset_n8n.sh
echo "echo 'Starting n8n again...'"                        >> /home/$USER/hard_reset_n8n.sh
echo "bash start_n8n.sh"                                   >> /home/$USER/hard_reset_n8n.sh
echo "echo '==**====**====='"                              >> /home/$USER/hard_reset_n8n.sh
echo "echo 'For uniformity, keep details as follows:'"     >> /home/$USER/hard_reset_n8n.sh
echo "echo '   email:       ashok@fsm.ac.in'"              >> /home/$USER/hard_reset_n8n.sh
echo "echo '   First Name:  ashok'"                        >> /home/$USER/hard_reset_n8n.sh
echo "echo '   Last Name:   harnal'"                       >> /home/$USER/hard_reset_n8n.sh
echo "echo '   password:   Ashok@12345'"                   >> /home/$USER/hard_reset_n8n.sh
echo "echo '==**====**====='"                              >> /home/$USER/hard_reset_n8n.sh
echo "sleep 3"                                             >> /home/$USER/hard_reset_n8n.sh
echo "netstat -aunt | grep 5678"                           >> /home/$USER/hard_reset_n8n.sh


# update n8n script
echo '#!/bin/bash'                                          >  /home/$USER/update_n8n.sh
echo " "                                                   >> /home/$USER/update_n8n.sh
echo "docker stop n8n"                                     >> /home/$USER/update_n8n.sh
echo "echo ' Updating n8n'"                               >> /home/$USER/update_n8n.sh
echo "sleep 3"                                             >> /home/$USER/update_n8n.sh
echo "netstat -aunt | grep 5678"                           >> /home/$USER/update_n8n.sh
echo "echo '==**====**====='"                              >> /home/$USER/update_n8n.sh
echo "docker pull docker.n8n.io/n8nio/n8n "                >> /home/$USER/update_n8n.sh
echo "echo '   n8n updated'"                               >> /home/$USER/update_n8n.sh

# Fallback mechanism if hostname -I returns empty (common on macOS or minimal Linux)
if [ -z "$IP_ADDRESS" ]; then
	IP_ADDRESS=$(ip route get 1 // | awk '{print $7}')
fi
# Print the detected IP for visibility
echo "Detected Local IP Address: $IP_ADDRESS"


chmod +x /home/$USER/*.sh


#############
# Install llamaindex folder of examples
# Installs the folder from github: LLM/llamaindex
############
echo "Install llamaindex folder of examples. Takes time..."
sleep 2
#  Download github folder 'llamaindex' using command line
#  Can copy and paste all at once:
cd ~/   
echo "  "
echo "---------   "
echo "Installing llamaindexExamples"
echo "---------   "
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

echo "Populating lprojects"
cd /home/$USER

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
echo "Done......"

