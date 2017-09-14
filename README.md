# adolan5's dotfiles
##### A collection of configurations and cmd tricks

## Vim
Contains adolan5's vimrc (both Linux and Windows). Has dependency on kien's ctrlp fuzzy search.

## myCMD
### Motivation
Windows has a terminal, cmd- and it's not great. Especially after you
move to Linux for a few minutes. For example, there's no easy way to
just  
`> cd ~`  
in cmd. Sure, you can `cd %USERPROFILE%`, but that's a lot to type.
Additionally, most programs don't insert their executables into your path
so that you can launch them from the command line.  
I've found that the command line is just a great way to move around the system.
Sure, Windows 10 now allows you to have an underlying Ubuntu bash on your
system, but it's still nice to work in the native cmd. Wouldn't it be nice
to be able to use cmd with a little more ease and be able to launch
programs with a single command?  
I'm kind of a "build it from the ground up" kind of guy, so I made this.

### Enter myCMD
myCMD is a collection of scripts that 'customize' cmd and make it a little
easier to work with. A lot of these changes will probably boil down to
personal preferences (such as names for aliases, etc.) The skeleton for
any changes is in place, however, and extra additions are not hard to
implement. myCMD also doesn't require you to add program directories to
your path, just the directory that you put myCMD in.

### Installation
1. Clone the repo (so long as you have some form of git installed on Windows)  
`> git clone https://github.com/adolan5/dotfiles.git`
2. Copy mycmd/\* into where you want myCMD to live (I'd recommend "C:\tools\mycmd" or something simple)
3. [Add your installation directory to your PATH](https://www.howtogeek.com/118594/how-to-edit-your-system-path-for-easy-command-line-access/)
4. Rename startup\_example.bat to startup.bat
5. Configure startup.bat for your environment (set aliases, set installation directories, etc.)

### Configuring your startup.bat
startup.bat currently has the default installation locations for notepad++ and Gimp 2.8
set. These variables are used by the npp.bat and gimp.bat scripts in launching their respective programs.
If you don't use these programs, feel free to delete one or both of the scripts and remove
the variables from your startup.bat.  
Aliases for commands are generally of the form:  
`doskey myalias=othercommand`  
and aliases for launching programs are generally of the form:  
`doskey myalias=Path\to\program.exe`  
**Note about aliased commands/programs:** Command options/arguments do
not work with aliases. For example, `ls ..` will *not* display the contents
of the directory one level up.

### Using myCMD
Since you (hopefully) added your myCMD install directory to your PATH,
you can run myCMD by typing `mycmd` in a regular cmd (**meta**), or
you can type `mycmd` in Run (WinKey+r).  
Additionally, you may want to create a shortcut to cmd.exe (C:\Windows\System32\cmd.exe),
and configure it to read in your startup.bat. You can do so by changing
its 'target' field to:
>C:\Windows\System32\cmd.exe /K Path\to\your\startup.bat

This way, you can run myCMD from a shortcut and even pin it to your task bar after launching it.

### Notes
* Be sure to realize that myCMD works by reading in your startup.bat, so
make sure that what it reads is reasonably safe.  
* Most scripts are decent about checking if your arguments/settings exist/are valid.
If you are receiving errors, check through this document to see if you have
moved files into proper locations and changed values of variables according
to your setup.  
* In startup.bat, directories that are assigned to variables should
**never** be in quotes!
* **Thanks for checking out myCMD!**
