#!/bin/bash

# create new git branch based on upstream/main
newBranch() {
     read -p "branch name: "  nBranchname
     git checkout -b "$Branchname" upstream/main
}

# push current branch to origin and return PR link
push(){
     # push current branch to origin
     git push origin "$Branchname"

     # create and display the URL of the PR
     PR_url="https://github.com/skyleilani/docs/compare/main...$Branchname?expand=1"
     echo "Pull Request: $PR_url"
}

# first git commit with ticket # and title
createPR(){ 
     # ask for ticket number and preferred PR title
     read -p "I need the docs ticket number. Tf ima do w/no ticket number? Fill it in right now. Whats not clicking Steven??" DOCS_TICKET
     read -p "respectfully, whats the pr title?: " PR_TITLE

     # initial git commit
     git commit -m "$DOCS_TICKET $PR_DESCRIPTION"
}

# select a command
main() {
     echo "select a command:"
     echo "1. create a new branch (newBranch)"
     echo "2. push the current branch (push)" 
     echo "3. create a PR (createPR)"
     read -p "1, 2, or 3?" choice

     case $choice in
          1) newBranch ;;
          2) push ;;
          3) createPR ;;
          *) echo "this is an error message bc u outta options";;
     esac 
}

main
