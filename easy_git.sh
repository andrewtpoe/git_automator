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
# alias tiy=". ~/bin/tiyhw.sh"
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
    brew install hub
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
  echo "This function automates creating a new git repository on your computer and GitHub."
  echo ""
  echo "First, you will be asked for the name of your new directory/ repository"
  echo "Next you will be asked for your project's name, it will be in your README file"
  echo ""
  echo "Finally, these commands will be run:"
  echo ""
  echo "mkdir: < New Directory Name >       # Creates the folder for your new repository"
  echo "cd < New Directory Name >           # Moves you into the new folder"
  echo "git init                            # Initializes this folder as new repository"
  echo "hub create                          # Initializes your new repository on Github"
  echo "git add -A                          # Add all the files created so far."
  echo "git commit -m 'Initial Commit'      # Creates the comment on the first commit"
  echo "git push origin master              # Pushes everything onto GitHub"
  echo "git checkout -b dev                 # Makes and checks out the dev branch"
  echo ""
  read -p "Type 'y' to proceed: " exit_func
  echo ""
################ edits stopped here ################################################

  # See if the user would like to exit this function.
  if [ "$exit_func" == "y" ]; then

  # Gather the name for the folder and the repo
  read -p "Enter a new directory name: " folder
  echo ""

  # Create the README file for this repository
  read -p "Enter project title: " project_title

    # Add in error checking to determine if this folder already exists.
    # Proceed if no folder, display error and exit if folder does exist.
    if [[ ! -e $folder ]]; then
      # Create the folder and make it the focus.
      mkdir $folder
      cd $folder

      # Initialize an empty Git repository.
      git init

      # Initialize repo on GitHub
      hub create

      # Add the project title to the README
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
    echo "Aborting the create-new-repo process."
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

if [ "$1" = "new_repo" ]; then
  new_repo

elif [ "$1" = "is_working" ]; then
  echo "The easy_git script is working correctly. Congratulations!"

elif [ "$1" = "first_run" ]; then
  system_check

else
  echo "tiy does not have a function by that name."

fi
