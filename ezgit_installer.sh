#*****************************************************************************#
# This is the install script for easy_git, my solution to simplifying the process
# of interacting with GitHub.
#*****************************************************************************#

# First, cURL and install the actual easy_git script
curl -o /usr/local/bin/ezgit https://raw.githubusercontent.com/andrewtpoe/git_automator/dev/ezgit

# chmod +x /usr/local/bin/ezgit
# Perform the "first run" to acquire all of the dependencies needed
# eval ". ~/usr/local/bin/easy_git.sh first_run"
#
# # Add the correct lines into that bash-profile
# echo "" >> ~/.bash_profile
# echo "##################################################" >> ~/.bash_profile
# echo "# This section adds the alias for easy_git" >> ~/.bash_profile
# echo "" >> ~/.bash_profile
# echo "alias easyg=". ~/usr/local/bin/easy_git.sh"" >> ~/.bash_profile
# echo "" >> ~/.bash_profile
# echo "##################################################" >> ~/.bash_profile
#
# # Reload the bash_profile
# source ~/.bash_profile
#
# Ensure everything is working correctly
echo "Everything appears to have worked correctly. "
echo ""
echo "Please type | ezgit is_working | to confirm."
echo ""
