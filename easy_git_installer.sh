#*****************************************************************************#
# This is the install script for easy_git, my solution to simplifying the process
# of interacting with GitHub.
#*****************************************************************************#

# First, cURL and install the actual easy_git script
curl -o ~/bin/easy_git.sh https://raw.githubusercontent.com/andrewtpoe/git_automator/dev/easy_git.sh

# Perform the "first run" to acquire all of the dependencies needed

eval ". ~/bin/easy_git.sh first_run"

# Add the correct lines into that bash-profile
echo "##################################################" >> ~/.bash_profile
echo "# This section adds the alias for easy_git" >> ~/.bash_profile
echo "" >> ~/.bash_profile
echo "alias easyg=". ~/bin/easy_git.sh"" >> ~/.bash_profile
echo "" >> ~/.bash_profile
echo "##################################################" >> ~/.bash_profile

# Reload the bash_profile
. ~/.bash_profile

# Ensure everything is working correctly
easyg is_working
