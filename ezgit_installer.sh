#*****************************************************************************#
# This is the install script for ezgit, my solution to simplifying the process
# of interacting with GitHub.
#*****************************************************************************#

# cURL and install the actual ezgit script
curl -o /usr/local/bin/ezgit https://raw.githubusercontent.com/andrewtpoe/git_automator/dev/ezgit

# Change the permissions on the file to make it executable
chmod +x /usr/local/bin/ezgit

echo "Checking for dependencies..."
echo ""
ezgit system_check

# Echo out some nice friendliness...
echo "Everything appears to have worked correctly. "
echo ""
echo "Please type | ezgit is_working | to confirm."
echo ""
