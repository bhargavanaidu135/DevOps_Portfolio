#!/bin/bash
set -e

# DEPLOY_DIR1="/var/www/html"
DEPLOY_DIR2="/usr/share/nginx/html"

cd "DevOps_Portfolio"

echo "Pulling latest changes..."
PULL_OUTPUT=$(git pull)

case "$PULL_OUTPUT" in
  *"Already up to date."*|*"Already up to date"*)
    echo "No changes to deploy!"
    exit 0
    ;;
esac

echo "Deploying to target directories..."
# rsync -av --delete ./* "$DEPLOY_DIR1"/
rsync -av --delete ./* "$DEPLOY_DIR2"/

echo "Deployment has been completed."