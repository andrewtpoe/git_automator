I built this script because I found myself performing numerous repetitive git, hub, and other terminal commands in the same order over and over again. This script automates those many commands down to just a few function calls.

I plan to add more functions to this as I go along. If you have a series of git/ hub related terminal commands that you find yourself repeating frequently, please open an issue documenting the commands and what they perform, or fork the repo and add it yourself.

Install this script by entering the following command into your terminal:

```
curl -sS https://raw.githubusercontent.com/andrewtpoe/git_automator/dev/ezgit_installer.sh | bash
```

This script will install homebrew, git, and hub as needed, then print something in your terminal if it is working correctly.

You should now have access to these functions by typing:
```bash
ezgit function_name
```

The functions currently in this script include:

* create_repo  -  Creates a new directory on your computer and a new repository on GitHub. Creates a README file with the project title as the sole line. Creates and makes active a branch called "dev".

* is_working  -  Runs a simple test to ensure the the script is installed and working correctly.

* system_check - Performs a system check and installs any missing dependencies.
