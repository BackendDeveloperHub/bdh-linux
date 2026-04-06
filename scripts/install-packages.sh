# Install pipx for safe CLI tool installation
sudo pacman -S --noconfirm python-pipx

# Install Python packages (Bypassing Arch Linux restriction for global install)
pip install fastapi[standard] uvicorn sqlalchemy psycopg2-binary python-dotenv --break-system-packages

# Install BDH CLI tools using pipx
pipx install bdh-fastapi-new
pipx ensurepath
