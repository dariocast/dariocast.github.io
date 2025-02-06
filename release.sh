#!/bin/bash

# Get current date in yyyy-MM-dd format
CURRENT_DATE=$(date +"%Y-%m-%d")

# Add changes and commit with date in the message
git add .
git commit -m "docs: site update on $CURRENT_DATE"

# Push changes
git push origin main

echo "Website update completed and pushed. View live at https://dariocast.github.io"