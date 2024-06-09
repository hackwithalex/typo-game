#!/bin/bash

VERSION="1.0"
WORDS=("banana" "apple" "grape" "orange" "mango" "pineapple" "strawberry" "blueberry" "kiwi" "watermelon" "pear" "peach" "plum" "cherry" "raspberry" "lemon" "lime" "grapefruit" "papaya" "fig")

# Function to display help
function display_help() {
    echo "Typo Game"
    echo
    echo "Usage: $0 [options]"
    echo
    echo "Options:"
    echo "  -h, --help      Show this help message and exit"
    echo "  -v, --version   Show game version and exit"
    echo
}

# Function to display version
function display_version() {
    echo "Typo Game version $VERSION"
}

# Function to start the game
function start_game() {
    clear
    echo "Welcome to the Typo Game!"
    echo "Type the words as quickly and accurately as possible."
    echo "You have 30 seconds. Ready? Go!"

    SCORE=0
    START_TIME=$(date +%s)
    END_TIME=$((START_TIME + 30))

    while [ $(date +%s) -lt $END_TIME ]; do
        WORD=${WORDS[$RANDOM % ${#WORDS[@]}]}
        echo -n "$WORD: "
        read INPUT
        if [ "$INPUT" == "$WORD" ]; then
            SCORE=$((SCORE + 1))
        fi
    done

    echo "Time's up! Your score is: $SCORE"
}

# Main script logic
if [[ $# -eq 0 ]]; then
    start_game
else
    case $1 in
        -h|--help)
            display_help
            ;;
        -v|--version)
            display_version
            ;;
        *)
            echo "Unknown option: $1"
            echo "Use -h or --help for usage information."
            ;;
    esac
fi
