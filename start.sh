#!/bin/bash

# Check if START_COMMAND is set
if [ -z "$START_COMMAND" ]; then
    echo "[ERROR] START_COMMAND must be set"
    exit 1
fi

# If GIT_REPO is set, clone the repository or pull changes if it already exists
if [ -n "$GIT_REPO" ]; then
    if [ -d "/home/app/.git" ]; then
        echo "[INFO] Repository already exists. Pulling latest changes."
        cd /home/app
        git pull
        if [ $? -ne 0 ]; then
            echo "[ERROR] Failed to pull repository"
            exit 1
        fi
    else
        echo "[INFO] Cloning repository: $GIT_REPO"
        git clone "$GIT_REPO" /home/app
        if [ $? -ne 0 ]; then
            echo "[ERROR] Failed to clone repository"
            exit 1
        fi
        
        # Navigate to the cloned repository
        cd /home/app
    fi
else
    echo "[WARNING] No GIT_REPO specified, using current directory"
fi

# Execute the start command
echo "[INFO] Executing: $START_COMMAND"
eval "$START_COMMAND"