#!/bin/bash

# Define the file names
install_script="install_packages.sh"

# Get the list of installed packages
dpkg --get-selections > package_list.txt

# Create the installation script
echo "#!/bin/bash" > "$install_script"
echo "" >> "$install_script"
echo "# Install all packages listed in $package_list_file" >> "$install_script"
echo "while read package _status; do" >> "$install_script"
echo "    sudo apt-get install -y \$package" >> "$install_script"
echo "done < package_list.txt" >> "$install_script"

# Make the script executable
chmod +x "$install_script"

# Display instructions for the user
echo "Package list saved to $package_list_file"
echo "To install these packages on another computer, transfer $package_list_file and $install_script to that computer, and then run ./$install_script"
