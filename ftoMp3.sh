#!/bin/bash
# This script is capable of converting FLAC encoded files to mp3 files, 
# RECURSIVELY, for any subdirectory of the one given as argument. 
# The conversion uses ffmpeg and libmp3lame and might take some time on less powerful devices. 

# check args
if [ $# -ne 1 ]; then
	echo "Usage: ./ftoMp3.sh [starting dir]"
	exit
fi

DIRNAME=mp3s
cnt=0

# the script create a directory called $DIRNAME in which it stores the files converted
# inside $DIRNAME the directory structure of the argument given by command line is preserved 
mkdir -p $DIRNAME

# saves from unwanted space splittings
OIFS="$IFS"
IFS=$'\n'

for dir in $(find "$1" -type d)
do
	# for each FLAC file in the subdirectory $dir of $1, convert it to mp3
	for a in $(find $dir -maxdepth 1 -name "*.flac")
	do
		let cnt=$cnt+1
		ffmpeg -i "$a" -qscale:a 0 "${a[@]/%flac/mp3}"
	done

	# if at least one FLAC was converted
	if [ $cnt -gt 0 ]; then
		# create subdir for mp3 files
		mkdir -p "$DIRNAME/$dir"
		
		# move each file to that subdir
		for file in $(find $dir -name "*.mp3")
		do
			mv "$file" "$DIRNAME/$dir"
		done

		echo "Converted $cnt files to mp3 in directory $dir"
		let cnt=0
	fi
done

IFS="$OIFS"
echo "Conversion terminated."
