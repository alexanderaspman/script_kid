#!/bin/bash

# Define the service file path
FILE="/etc/scripts/service/script_kid_service"

# Check if the script is running as root
if [ "$EUID" -ne 0 ]; then
  echo "Please run as root"
  exit
fi

# Change permissions of the script file
chmod +x sneaky_script.sh

# Define the script_kid function
script_kid() {
  # Change permissions of the service startup script
  chmod +x "$FILE"

  # Enable and start the service
  systemctl enable "$FILE"
  systemctl start "$FILE"

  # Check if the service file exists
  if [ -f "$FILE" ]; then
    echo "Service file exists"
  else
    echo "Service file does not exist"
  fi
}

# Call the script_kid function
script_kid


