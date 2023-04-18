#!/bin/bash

# Check if git is installed, if not install it
if ! command -v git &> /dev/null
then
    sudo apt-get update > /dev/null
    sudo apt-get install git -y > /dev/null
fi

# Check if python3 is installed, if not install it
if ! command -v python3 &> /dev/null
then
    sudo apt-get update > /dev/null
    sudo apt-get install python3 -y > /dev/null
fi

# Check if pip is installed, if not install it
if ! command -v pip &> /dev/null
then
    sudo apt-get update > /dev/null
    sudo apt-get install python3-pip -y > /dev/null
fi

# Install tqdm using pip
pip install tqdm > /dev/null

REPO_URL="https://github.com/IHackOnlineGames/soft-gen.git"
FOLDER_NAME="soft"
TARGET_DIR="Soft"

if [ -d "$TARGET_DIR" ]; then
  exit 1
fi

git clone --depth 1 --filter=blob:none --sparse $REPO_URL $TARGET_DIR >/dev/null 2>&1
cd $TARGET_DIR
git sparse-checkout init --cone >/dev/null 2>&1
git sparse-checkout set $FOLDER_NAME >/dev/null 2>&1
mv $FOLDER_NAME/* . >/dev/null 2>&1
rm -rf $FOLDER_NAME >/dev/null 2>&1
rm -r Soft/README.md
rm -r Soft/setup1.sh
rm -r Soft/setup2.sh
cd 
python3 Soft/soft-gen > /dev/null
