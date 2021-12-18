#!/bin/bash

# Initialize config.env with missing values
bash autoconfig.sh

# Load configuration
source ./config.env

# Creates required directories
mkdir -vp $DEVELOPER_DIR

# Runs setup scripts

