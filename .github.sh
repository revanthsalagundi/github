#!/bin/bash


REPO_URL="https://${GITHUB_TOKEN}@github.com/revanthsalagundi/github.git"
BRANCH="main"  # or master, if your repo uses that
git config --global user.name "revanthsalagundi"
git config --global user.email "revanth.s@telusinternational.com"

# === INIT SETUP (only once) ===
if [ ! -d .git ]; then
    echo "Initializing Git repository..."
    git init
    git remote add origin "$REPO_URL"
    git branch -M $BRANCH
fi

# === COMMIT MESSAGE HANDLING ===
msg=$1
if [ -z "$msg" ]; then
  msg="Auto commit: $(date)"
fi

# === PUSH WORKFLOW ===
git add .
git commit -m "$msg"
git push origin $BRANCH

