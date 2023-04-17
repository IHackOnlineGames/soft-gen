git --version
sudo apt install python3
sudo apt install pip
sudo pip install tqdm
#!/bin/bash
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
python3 Soft/soft-gen
