#!/bin/bash

validate_password() {
    local password="$1"
    if [[ ${#password} -lt 8 ]]; then
        echo "Password must be at least 8 characters long."
        return 1
    fi

    if ! [[ "$password" =~ [A-Z] ]]; then
        echo "Password must contain at least one uppercase letter."
        return 1
    fi

    if ! [[ "$password" =~ [0-9] ]]; then
        echo "Password must contain at least one digit."
        return 1
    fi

    return 0
}

while true; do
    echo "Enter a password:"
    read -s password
    if validate_password "$password"; then
        echo "Password accepted!"
        break
    else
        echo "Please try again."
    fi
done
