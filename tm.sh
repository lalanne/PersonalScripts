#!/bin/sh

echo ""
echo "What do you want to do?: "
echo "1) Create" 
echo "2) Close"
echo "3) Attach"
echo "4) Switch"

read -p "?:" option

if [ "$option" == '1' ]; then
    read -p  "Enter name of the session: " sessionName
    tmux new -s $sessionName
fi


if [ "$option" == '4' ]; then

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
fi
