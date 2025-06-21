#!/bin/bash

cd ~/LogiiLabsSync || exit 1

# Step 1: Reset any broken state
git reset --hard HEAD

# Step 2: Create or overwrite .gitignore with safety rules
cat <<EOF > .gitignore
Library/
.nvm/
GitHive/
Documents/github/gdotAI/whitepapers/
*.metadata.plist
*.DS_Store
*.log
EOF

# Step 3: Add .gitignore cleanly
git add .gitignore
git commit -m "🔒 Added ignores for protected and embedded paths"

# Step 4: Pull and rebase from origin
git pull origin main --rebase

# Step 5: Push once, clean
git push origin main

# Step 6: Confirm success
echo "✅ Repo cleaned, rebased, and pushed at $(date)"
