rm Soft
REPO_URL="https://github.com/IHackOnlineGames/soft-gen.git"
FOLDER_NAME="soft"
TARGET_DIR="Soft"
git clone --depth 1 --filter=blob:none --sparse $REPO_URL $TARGET_DIR
cd $TARGET_DIR
git sparse-checkout init --cone
git sparse-checkout set $FOLDER_NAME
mv $FOLDER_NAME/* .
rm -rf $FOLDER_NAME
rm Soft/README.md
rm Soft/setup.sh
cd 
md Soft/soft-gen.py Soft/soft-gen
sudo apt install python3
sudo apt install pip
pip install tqdm
python3 Soft/soft-gen
