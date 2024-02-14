echo "--- starting "

venv_dir="$(dirname "$0")/python-dev-env/"  # set the name of the virtual environment directory

if [ -d "$venv_dir/bin/" ]; then
    echo "Virtual environment already exists. Skipping creation."
else
    echo "Creating virtual environment..."
    if ! python3 -m venv "$venv_dir"; then
        echo "Failed to create virtual environment. Exiting."
        exit 1
    fi
fi

echo "Virtual environment is ready."

source "$(dirname "$0")/python-dev-env/bin/activate"

pip install --upgrade pip # Updating pip

# Reading package names from requirements.txt
REQ_FILE="$(dirname "$0")/requirements.txt"

if [ ! -f "$REQ_FILE" ]; then
    echo "requirements.txt file not found. Exiting."
    exit 1
fi

# Get a list of installed packages
INSTALLED_PACKAGES=$(pip list --format=freeze)

# Install packages from requirements.txt
while IFS= read -r PACKAGE || [[ -n "$PACKAGE" ]]; do
    if echo "$INSTALLED_PACKAGES" | grep -q "^$PACKAGE=="; then
        echo "$PACKAGE is already installed."
    else
        echo "$PACKAGE is not installed. Installing..."
        pip install "$PACKAGE"
    fi
done < "$REQ_FILE"

echo "--- starting jupyter lab"
jupyter lab --NotebookApp.max_mem_rate=0.3 --NotebookApp.token='dev' --notebook-dir="$(dirname "$0")/.."
