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
    read -p "Which session number would you like to switch(-1 to quit):" session
    if [ "$session" == '-1' ]; then
        exit 0
    fi
    tmux switch -t ${sessions[$session]}
done

