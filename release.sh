#!/bin/bash

# Add changes and commit
git add .
git commit -m "docs: site update"

# Git flow release (using current timestamp as release name)
RELEASE_NAME=$(date +"%Y%m%d%H%M%S")
git flow release start "$RELEASE_NAME"
git flow release finish -m "Release $RELEASE_NAME" "$RELEASE_NAME"

# Push changes and tags
git push origin main
git push --tags

echo "Release $RELEASE_NAME completed and pushed."
