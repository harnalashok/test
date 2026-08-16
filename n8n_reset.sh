# Last amended: 16/08/2026
# Execute the script as below:
# cd ~/
# wget https://raw.githubusercontent.com/harnalashok/test/refs/heads/main/n8n_reset.sh
# bash n8n_reset.sh

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

IP_ADDRESS=$(hostname -I | awk '{print $1}')
# Fallback mechanism if hostname -I returns empty (common on macOS or minimal Linux)
if [ -z "$IP_ADDRESS" ]; then
	IP_ADDRESS=$(ip route get 1 // | awk '{print $7}')
fi
# Print the detected IP for visibility
echo "Detected Local IP Address: $IP_ADDRESS"

# n8n start script for Ubuntu
echo '#!/bin/bash'                                                                                                        > /home/$USER/start_n8n.sh
echo " "                                                                                                                >> /home/$USER/start_n8n.sh   
echo "IP_ADDRESS=\$(hostname -I | awk '{print \$1}')"                                                                   >> /home/$USER/start_n8n.sh                                                                                                    >> /home/$USER/start_n8n.sh
echo "echo 'Access n8n at port 5678. Wait...starting...'"                                                               >> /home/$USER/start_n8n.sh
echo "echo 'To update it, issue command: ./update_n8n.sh'"                                                              >> /home/$USER/start_n8n.sh
echo "echo 'To stop it,   issue command:  docker stop n8n'"                                                              >> /home/$USER/start_n8n.sh
echo "echo 'In case n8n download fails, press Windows+R and execute smc -stop '"                                         >> /home/$USER/start_n8n.sh
echo "echo 'n8n community nodes available at:'"                                                                           >> /home/$USER/start_n8n.sh
echo "echo '==>    https://ncnodes.com/packages'"                                                                          >> /home/$USER/start_n8n.sh
echo "echo 'Use \"top -u $USER\" OR \"free -g \" command to see memory usage'"                                             >>  /home/$USER/start_n8n.sh
echo "sleep 9"                                                                                                             >> /home/$USER/start_n8n.sh
#echo "cd /home/$USER/n8n"                                                                                                  >> /home/$USER/start_n8n.sh
echo "docker run -it -d --rm --name n8n -p 5678:5678 -e WEBHOOK_URL=\"http://${IP_ADDRESS}:5678/\" -e NODE_OPTIONS=\"--max-old-space-size=4096\" --network host -v n8n_data:/home/node/.n8n docker.n8n.io/n8nio/n8n"   >> /home/$USER/start_n8n.sh
echo "echo 'n8n version is'"    																						   >> /home/$USER/start_n8n.sh
echo  "docker exec -it n8n n8n --version"  																				   >> /home/$USER/start_n8n.sh
echo "echo \"\"\${IP_ADDRESS}\"\""                                                                                         >> /home/$USER/start_n8n.sh

chmod +x /home/$USER/*.sh


#############
# Install llamaindex folder of examples
# Installs the folder from github: LLM/llamaindex
############
echo "Install llamaindex folder of examples. Takes time..."
sleep 2
#  Download github folder 'llamaindex' using command line
#  Can copy and paste all at once:
cd /home/$USER
cd ~/   
echo "  "
echo "   "
echo "Installing llamaindexExamples"
sleep 3
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
mv /home/$USER/Documents/llamaindexExamples/llamaindex/* 
rm -rf /home/$USER/Documents/llamaindexExamples
cd /home/$USER
rm -rf /home/$USER/lprojects
mkdir /home/$USER/lprojects
cp /home/$USER/Documents/llamaindex/revised14042026/*.pdf    /home/$USER/lprojects
cp /home/$USER/Documents/llamaindex/revised14042026/*.ipynb  /home/$USER/lprojects
echo "llamaindexExamples_installed.txt" > /home/$USER/llamaindexExamples_installed.txt

echo "Done......"

