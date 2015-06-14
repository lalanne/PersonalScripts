#!/bin/bash

echo ""
echo "Sessions on this machine are: "
echo ""

tmux ls > tmux_sessions.tmp
cat tmux_sessions.tmp | awk '{print $1}' | tr -d ":" 
rm tmux_sessions.tmp

echo ""
read -p "Enter the name of the seesion that you want to load: " session

echo ""
echo "OK, lets load ${session}"
echo ""

tmux attach -t ${session}
echo "${$?}"

echo ""
