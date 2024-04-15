# rigolscope
Get a screenshot from your Rigol oscilloscope to your Linux computer quick and easy over its network connection.

Edit line 12 to let the variabel IP represent you scope's IP address before you start the script.
Place the script in your ~/bin directory and make it executable with chmod u+x ~/bin/scope.sh

Then cd into a directory in which you want to store the screenshots. Run the program scope.sh every time you wish
to transfer a screenshot of your scope's display to this directory. Every file will have unique filename, containing
the current timestamp.
You can also specify the filename you wish to save the screenshot as.
Pictures are stored as png files.

More information can be found on https://www.sbprojects.net/mylab/mso1104z/
