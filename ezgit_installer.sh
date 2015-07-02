#*****************************************************************************#
# This is the install script for easy_git, my solution to simplifying the process
# of interacting with GitHub.
#*****************************************************************************#

# cURL and install the actual easy_git script
curl -o /usr/local/bin/ezgit https://raw.githubusercontent.com/andrewtpoe/git_automator/dev/ezgit

chmod +x /usr/local/bin/ezgit

echo "Everything appears to have worked correctly. "
echo ""
echo "Please type | ezgit is_working | to confirm."
echo ""
