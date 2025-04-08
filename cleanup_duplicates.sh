#!/bin/bash

# Directories to scan for duplicates
DIRECTORIES=(
    "~/agentic-deployment-v5"                # Main folder for the deployment
    "~/agentic-deployment-v5/tables"         # Tables folder
    "~/agentic-deployment-v5/deployment"     # Deployment folder
    "~/agentic-deployment-v5/scripts"        # Scripts folder
    "~/agentic-deployment-v5/tests"          # Tests folder
)

# Convert ~ to the full home directory path
for i in "${!DIRECTORIES[@]}"; do
    DIRECTORIES[$i]="${DIRECTORIES[$i]//\~/$HOME}"
done

# Install fdupes if it's not already installed
if ! command -v fdupes &> /dev/null
then
    echo "fdupes not found. Installing..."
    sudo apt-get install -y fdupes
else
    echo "fdupes is already installed."
fi

# Function to scan and show duplicate files
scan_for_duplicates() {
    echo "Scanning for duplicate files..."
    for DIR in "${DIRECTORIES[@]}"; do
        if [ -d "$DIR" ]; then
            echo "Scanning directory: $DIR"
            fdupes -r "$DIR" >> duplicates.txt
        else
            echo "Directory $DIR does not exist!"
        fi
    done

    # Show the found duplicates
    if [ -s duplicates.txt ]; then
        echo "Duplicates found:"
        cat duplicates.txt
    else
        echo "No duplicates found!"
    fi
}

# Function to clean duplicates
clean_duplicates() {
    echo "Do you want to delete these duplicates? (y/n)"
    read confirmation
    if [ "$confirmation" == "y" ]; then
        # Running fdupes to delete duplicates
        sudo fdupes -d -r "${DIRECTORIES[@]}"
        echo "Duplicate files deleted."
    else
        echo "No files were deleted."
    fi
}

# Main function to start scanning and cleaning
main() {
    # Step 1: Scan for duplicates
    scan_for_duplicates
    
    # Step 2: Ask user to clean duplicates
    clean_duplicates
}

# Run the main function
main
