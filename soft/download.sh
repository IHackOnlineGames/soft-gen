sudo apt install python3
wget https://github.com/IHackOnlineGames/soft-gen/raw/main/soft/soft-gen.py
echo "Do you want to run this program? y for yes and n for no"
read -p "" choise
if [[ "$choise" == "y" ]]; then
  echo "Running program"
  sleep 5
  python3 soft-gen.py
elif [[ "$choise" == "n" ]]; then
  echo "Canseling"

