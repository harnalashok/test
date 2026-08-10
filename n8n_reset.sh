# Reset n8n password
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

# update n8n
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
echo '#!/bin/bash'                                                                                     > /home/$USER/start_n8n.sh
echo " "                                                                                              >> /home/$USER/start_n8n.sh
echo "echo 'Access n8n at port 5678. Wait...starting...'"                                             >> /home/$USER/start_n8n.sh
echo "echo 'To update it, issue command: ./update_n8n.sh'"                                             >> /home/$USER/start_n8n.sh
echo "echo 'To stop it,   issue command:  docker stop n8n'"                                            >> /home/$USER/start_n8n.sh
echo "echo 'n8n community nodes available at:'"                                                        >> /home/$USER/start_n8n.sh
echo "echo '==>    https://ncnodes.com/packages'"                                                      >> /home/$USER/start_n8n.sh
echo "echo 'Use \"top -u $USER\" OR \"free -g \" command to see memory usage'"                         >>  /home/$USER/start_n8n.sh
echo "echo 'Next time start as: docker start n8n'"  						       >>  /home/$USER/start_n8n.sh
echo "sleep 9"                                                                                          >> /home/$USER/start_n8n.sh
echo "docker run -it -d --rm --name n8n -p 5678:5678 -e WEBHOOK_URL=\"http://${IP_ADDRESS}:5678/\" -e NODE_OPTIONS=\"--max-old-space-size=4096\" --network host -v n8n_data:/home/node/.n8n docker.n8n.io/n8nio/n8n"   >> /home/$USER/start_n8n.sh
echo "echo 'n8n version is'"                   						                >> /home/$USER/start_n8n.sh
echo "docker exec -it n8n n8n --version"    							        >> /home/$USER/start_n8n.sh

chmod +x /home/$USER/*.sh
echo "Done......"

