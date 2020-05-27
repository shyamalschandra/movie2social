#!/bin/bash

# Input parameters to the script that converts movies into a Instagram-compatible video
INPUT_FILE=$2    # The input file (compatible with FFMPEG) and extension
OUTPUT_FILE=$3   # The output file and extension
NUM_THREADS=$1   # The number of threads to use in the conversion
POSITION=$4      # The x-axis position on the video

# Based on the input string, sets the x accordingly to the right location to show on the horizontal axis of the video
if [ $POSITION = "left" ]; then
	x=0
elif [ $POSITION = "middle" ]; then
	x=640
elif [ $POSITION = "right" ]; then
	x=1280
else
	echo "Something went wrong!"  # Error message for user
fi

# Perform the ffmpeg conversion to the social aspect ratio with the desired arguments
ffmpeg -loglevel warning -y -threads $1 -i $2 -vf "scale=1920:1080,crop=607:960:$x:0" -acodec copy -c:a copy $3
