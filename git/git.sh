# Stop tracking a tracked file
git rm -r --cached .
git rm -r --cached node_modules

# Discarding all Changes in your working directory
git restore .

# Discard all changes in your local repo to exact state in remote
git reset --hard origin/main

# Mark file as executable
git update-index --chmod=+x install.sh
