#!/bin/bash

echo -e "\033[0;32mDeploying updates to GitHub...\033[0m"

# Build the project.
echo "building the website using hugo command..."
hugo # if using a theme, replace with `hugo -t <YOURTHEME>`

# Go To Public folder
cd public
# Add changes to git.
git add .

# Commit changes.
msg="rebuilding site `date`"
if [ $# -eq 1 ]
  then msg="$1"
fi

echo "before commit "
git commit -m "$msg"

# Push source and build repos.
echo "before push to remote repo "
git push origin master

# Come Back up to the Project Root
cd ..
