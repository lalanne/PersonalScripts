#!/bin/bash

echo ""
echo "Sessions on this machine are: "
echo ""

tmux ls > tmux_sessions.tmp
cat tmux_sessions.tmp | awk '{print $1}' | tr -d ":" 
numberOfSessions=`cat tmux_sessions.tmp | wc -l`
rm tmux_sessions.tmp

read -p "Would you like to join or create new session(j/n): " jn
if [ "$jn" == "n" ];
then
    read -p "Name?: " name
    echo ""
    echo "creating a new session......"
    echo ""
    tmux new -s ${name}
    exit
fi

echo ""
read -p "Enter the name of the seesion that you want to load: " session

echo ""
echo "OK, lets load ${session}"
echo ""

tmux attach -t ${session}

echo ""
