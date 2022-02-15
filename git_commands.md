# Most tasks are done localy on Win11x64 using VSCode and "Git for Windows" installed
# Commits are runned without "-m" key, descriptions written in VSCode text editor
###################################################################################
# 1. Create a Github account(if you don’t have one).
# 2. Create new Github repository.
# 3. Create “Task1” folder in the master branch. Create and push ./Task1/README.md file

git init
mkdir Task1
echo "This is the main brench message" > .\Task1\README.md
git add .
git commit
git branch -M main
git remote add origin git@github.com:BudValZer/exadel-internship.git
git push -u origin main

# 4. Create new branch dev. Create and push any test file.

git checkout -b dev
echo "This file was created on dev brench" > .\Task1\test_file.txt
git add .
git commit
git push -u origin head

# 5. Create new branch %USERNAME-new_feature.
# 6. Add README.md file to your %USERNAME-new_feature branch
# 7. Check your repo with git status command
###################################################################
# Due to powershell syntax, $env:USERNAME used instead of %USERNAME

git checkout -b ("$env:USERNAME-new_feature")
echo "This line was added to a file on $env:USERNAME-new_feature branch" >> .\Task1\README.md
git add .
git commit
git status
git push -u origin head

# 8. Add .gitignore file to ignore all files whose name begins “.”
# 9. Commit and push changes to github repo.

echo ".*
!/.gitignore" > .gitignore
git add .
git commit
git push

# 10. Create Pull Request to the dev branch.
# 11. Merge your branch with the dev branch and create Pull Request to the master(main) branch. Merge dev with master(main)
##################################################################################################
# Pull requests are done in browser

git switch dev
git merge root-new_feature
git switch main
git merge dev

# 12. Checkout to %USERNAME-new_feature, make changes in README.md and commit them. Revert last commit in %USERNAME-new_feature branch.

git switch root-new_feature
echo "Some additional changes" >> .\Task1\README.md
git add .
git commit
git push

git revert head
git push

# 13. Check your repo with git log command, create log.txt file in master(main) branch and save “git log” output in it.

git switch mail
git log > log.txt
git add .
git commit
git push

# 14. Delete local and remote branch %USERNAME-new_feature.

git branch -d root-new_feature
error: The branch 'root-new_feature' is not fully merged.
If you are sure you want to delete it, run 'git branch -D root-new_feature'.

# branch can be deleted with "-D" key, but I`ll merge once more for complete log below

git merge root-new_feature
git branch -d root-new_feature
git push --delete origin root-new_feature

git log > completelog.txt
git add .
git commit
git push

# 15. Add all used command to the git_commands.md file in the dev branch.

git switch dev

# file added to directory using explorer.exe

git add .
git commit
git push