#!/bin/bash

# Get current date in yyyy-MM-dd format
CURRENT_DATE=$(date +"%Y-%m-%d")

# Add changes and commit with date in the message
git add .
git commit -m "docs: site update on $CURRENT_DATE"

# Git flow release (using timestamp for unique release name)
RELEASE_NAME=$(date +"%Y%m%d%H%M%S")
git flow release start "$RELEASE_NAME"

# Finish release without spaces in the message argument
git flow release finish "$RELEASE_NAME" -m"Release-$RELEASE_NAME"

# Push changes and tags
git push origin main
git push --tags

echo "Release $RELEASE_NAME completed and pushed."
