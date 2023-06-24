sudo apt install python3
wget https://github.com/IHackOnlineGames/soft-gen/raw/main/soft/soft-gen.py
sudo apt install pip
echo Installing assets.
pip install tqdm
mv soft-gen.py soft
if [ "$1" = "--soft" ]; then
    python3 soft
