I built this script because I found myself performing numerous repetitive git, hub, and other terminal commands in the same order over and over again. This script automates those many commands down to just a few function calls.

In addition, I felt I needed to learn some bash scripting. Here's an overview of things I've learned by building this:

* Bash syntax including calling functions
* Storing a script in ~/bin for easy access in the terminal
* How to load a script when a terminal is started
* How to create an alias so the script can be run with a very simple call
* How to pass in and access an argument when the script is called

Been a steep learning curve, but a fun one. I plan to add more features to this as I go along. If you have a series of git related terminal commands that you find yourself repeating frequently, please open an issue or fork the repo and add it yourself.


Here is what must currently be done to install this script.

- Place this file in ~/bin
- Add the following to your .bash_profile

```bash
# This loads the tiyhw file at the start of the terminal session.
eval ". ~/bin/tiyhw.sh"
# This sets an alias so the user can reload tiyhw.sh easily.
alias tiy=". ~/bin/tiyhw.sh"
```

- Now in your terminal, type "tiy is_working" (without the "") to test. This script will install homebrew, git, and hub as needed, then print something in your terminal if it is working correctly.



Here is a list of functions currently in this script:

* new_repo  -  Creates a new directory on your computer and a new repository on GitHub. Creates a README file with the project title as the sole line. Leaves you in the directory in a branch called "dev"

* is_working  -  Runs a simple test to ensure the the script is installed and working correctly.
