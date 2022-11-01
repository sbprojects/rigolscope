# /bin/bash

# This script saves a png of the current contents of the oscilloscope's screen.
# The user can specify a filename. If no filename is specified the program will
# create a hopefully unique one by itself.
#
# The IP address of the oscilloscope has to be assigned to the variable IP.
#
# exit code 1 if filename already exists.
# exit code 2 if no answer is received from the oscilloscope.

IP="10.6.1.160"

if [ "$1" = "-h" ]; then
    # Show help and exit
    echo "Usage: $0 [filename]"
    exit
fi

# The filename is optional
FILENAME="$1"

if [ "$FILENAME" = "" ]; then
    # No filename is given, generate one ourselves
    NOW=$(date +%Y%m%d_%H-%M-%S)
    FILENAME="scope_$NOW.png"
else
    # Otherwise just make sure extention is .png
    FILENAME=${FILENAME%.*}.png
fi

# Check if file already exists
if [ -e $FILENAME ]; then
    echo -e "File $output already exists.\nDelete or move it first.\nAborting!"
    exit 1
fi

# Cao=pture the picture. Strip the 12 byte header from it.
echo ':display:data? ON,0,PNG' | netcat -w 1 $IP 5555 | tail -c +12 > $FILENAME
LENGTH=$(wc -c $FILENAME | awk '{ print $1 }')
if [ $LENGTH -ne 0 ]
then
    echo -e "File saved as $FILENAME.\n"
else
    echo -e "Can't connect to oscilloscope.\n"
    rm $FILENAME
    exit 2
fi