#!/bin/sh

echo ""
echo "Tmux sessions in this machine: "
echo ""

sessions=( $(tmux ls | awk '{print $1}' | tr -d : | column -c 40) )

sessionNumber=0
for i in ${sessions[@]}
do
    echo "$sessionNumber) $i"
    let sessionNumber=sessionNumber+1
done 

echo ""

while true; do
    read -p "Which session would you like to switch:" session
    echo "tmux switch -t ${sessions[$session]}"
    tmux switch -t ${sessions[$session]}
done
