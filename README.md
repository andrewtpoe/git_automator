I built this script because I found myself performing numerous repetitive git, hub, and other terminal commands in the same order over and over again. This script automates those many commands down to just a few function calls.

I plan to add more features to this as I go along. If you have a series of git/hub related terminal commands that you find yourself repeating frequently, please open an issue or fork the repo and add it yourself.

Install this script by entering the following command into your terminal:

```
curl -s https://raw.githubusercontent.com/andrewtpoe/git_automator/dev/easy_git_installer.sh | bash
```

This script will install homebrew, git, and hub as needed, then print something in your terminal if it is working correctly.

- Now in your terminal, type < easyg is_working > to test.


Here is a list of functions currently in this script:

* new_repo  -  Creates a new directory on your computer and a new repository on GitHub. Creates a README file with the project title as the sole line. Leaves you in the directory in a branch called "dev"

* is_working  -  Runs a simple test to ensure the the script is installed and working correctly.
