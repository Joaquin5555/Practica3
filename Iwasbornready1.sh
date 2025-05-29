#!/bin/bash

get_computer_choice() {
    choices=("rock" "paper" "scissors")
    echo "${choices[$RANDOM % 3]}"
}

while true; do
    echo "Choose rock, paper, or scissors (or type 'exit' to quit):"
    read user_choice

    if [[ "$user_choice" == "exit" ]]; then
        echo "Thanks for playing."
        break
    elif [[ "$user_choice" != "rock" && "$user_choice" != "paper" && "$user_choice" != "scissors" ]]; then
        echo "Please enter rock, paper, or scissors."
        continue
    fi

    computer_choice=$(get_computer_choice)
    echo "Computer chose: $computer_choice"

    if [[ "$user_choice" == "$computer_choice" ]]; then
        echo "It's a tie!"
    elif [[ ("$user_choice" == "rock" && "$computer_choice" == "scissors") || 
            ("$user_choice" == "paper" && "$computer_choice" == "rock") || 
            ("$user_choice" == "scissors" && "$computer_choice" == "paper") ]]; then
        echo "You win!"
    else
        echo "Computer wins!"
    fi
done
