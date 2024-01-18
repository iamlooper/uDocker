#!/bin/bash

export PIP_ROOT_USER_ACTION=ignore

# Clone the upstream repo.
git clone -q "$UPSTREAM_REPO" app
cd app

# Install requirements.
pip install --no-cache-dir -r requirements.txt

# Run exec command.
bash -c "$EXEC_COMMAND"