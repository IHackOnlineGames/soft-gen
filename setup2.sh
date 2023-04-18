REM Create variables
SET REPO_URL=https://github.com/IHackOnlineGames/soft-gen.git
SET FOLDER_NAME=soft
SET TARGET_DIR=Soft

REM Clone the repository
git clone %REPO_URL% %TARGET_DIR%

REM Navigate to the target directory and set up sparse checkout
cd %TARGET_DIR%
git sparse-checkout init --cone
git sparse-checkout set %FOLDER_NAME%

REM Move files and remove unnecessary files
xcopy %FOLDER_NAME%\* .
rmdir /s /q %FOLDER_NAME%
del Soft\README.md
del Soft\setup2.sh
del Soft\setup1.sh

REM Install required software
choco install python3
pip install tqdm

REM Run the script
echo Entered Soft ver 1.0.1
python Soft\soft-gen.py
