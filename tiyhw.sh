#!/bin/bash

###############################################################################
#
# This script is designed to make the homework git workflow easier for students
# at The Iron Yard by automating the many git and hub commands frequently used.
#
# Place this file in ~/bin
# 
# Add the following to your .bash_profile (uncomment it first, duh)
# 
# # This loads the tiyhw file at the start of the terminal session.
# eval ". ~/bin/tiyhw.sh"
# # This sets an alias so the user can reload tiyhw.sh easily. 
# alias tiyhw=". ~/bin/tiyhw.sh"
#
# Now in your terminal, type "tiy is_working" (without the "") to test. This 
# script will install homebrew, git, and hub as needed, then print something
# in your terminal if it is working correctly.
#
###############################################################################


###############################################################################
# 
# This section of code declares the useful functions that will be found within.
# 
###############################################################################

# This script requires homebrew, git, and hub. Calling system_check determines 
# if the user has these and installs them if not.
function system_check {
  # Check for homebrew
  if test ! $(which brew); then
    echo "Installing homebrew..."
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  fi

  # Check for hub
  if test ! $(which hub); then
    echo "Installing hub..."
    brew istall hub
  fi

  # Check for git
  if test ! $(which git); then
    echo "Installing git..."
    brew install git
  fi
}

# This method creates a new github repository on your computer and on github.
function new_repo {

  # Intro and explain the script.
  echo "This function creates a new repository on your computer and on GitHub."
  echo ""

  # Gather the name for the folder and the repo
  read -p "Enter a new directory name: " folder
  echo ""

  # See if the user would like to exit this function.
  if [ "$folder" != "end" ]; then 
    # Add in error checking to determine if this folder already exists. 
    # Proceed if no folder, display error and exit if folder does exist.
    if [[ ! -e $folder ]]; then
      # Create the folder and make it the focus.
      mkdir -p $folder
      cd $folder

      # Initialize an empty Git repository.
      git init

      # Initialize repo on GitHub
      hub create

      # Create the README file for this repository
      read -p "Enter project title: " project_title

      echo "$project_title" > README.md

      # Add files
      git add -A

      # Create the "Initial Commit" message
      git commit -m "Initial Commit"

      # Push the empty master directory up to GitHub
      git push -u origin master

      # Create and open a new branch that is not the master
      git checkout -b dev
      echo "You now have a new git project and are working on the 'dev' branch."
      echo ""

    else
      echo "This folder already exists. This function can only"
      echo "be used to create a new directory and repository."
      echo ""
      echo "Please delete or rename your current directory,"
      echo "or try a different name for this new repository."
      echo ""
    fi
  else
    echo "Aborting the create new repo process"
    echo ""
  fi
  unset folder
}


# This method sets the branch variable to the name of the users currently 
# active git branch.
function determine_branch {
  if branch=$(git symbolic-ref --short -q HEAD)
  then
    echo "Currently on branch: $branch"
  fi
}


###############################################################################
#
# This is the portion of this script that handles determining the function that
# the user wants to perform based on argument #1, and calls the needed function
#
###############################################################################

system_check

if [ "$1" = "new_repo" ]; then
  new_repo

elif [ "$1" = "is_working" ]; then
  echo "The tiy script is working correctly. Congratulations!"

elif [ "$1" = "first_run" ]; then
  :

else
  echo "tiy does not have a function by that name."

fi