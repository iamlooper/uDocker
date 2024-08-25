#!/bin/bash

# Check if START_COMMAND is set
if [ -z "$START_COMMAND" ]; then
    echo "Error: START_COMMAND must be set"
    exit 1
fi

# If GIT_REPO is set, clone the repository
if [ -n "$GIT_REPO" ]; then
    echo "Cloning repository: $GIT_REPO"
    git clone "$GIT_REPO" /home/app
    if [ $? -ne 0 ]; then
        echo "Error: Failed to clone repository"
        exit 1
    fi
    # Navigate to the cloned repository
    cd /home/app
else
    echo "No GIT_REPO specified, using current directory"
fi

# Execute the start command
echo "Executing: $START_COMMAND"
eval "$START_COMMAND"