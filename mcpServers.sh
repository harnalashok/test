#!/bin/bash

# LAst amended: 22nd Sep, 2026

cd ~/
wget -Nc https://github.com/harnalashok/LLMs/blob/main/crewaiModels/mcpServer.zip?raw=true
mv mcpServer.zip\?raw\=true  mcpServer.zip
rm -rf /home/ashok/crewai_pjt/mcp_servers/*
mv mcpServer.zip /home/ashok/crewai_pjt/mcp_servers/
cd /home/ashok/crewai_pjt/mcp_servers/
unzip mcpServer.zip
cd ~/
