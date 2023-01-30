#!/bin/bash

# Loops through all the images with the provided pattern and creates a single image with all their prompt uniqueness as labels.

# usage :
# ./aigallery.sh <directory> <image glob> <pre-prompt> <post-prompt> <number of columns> <page title>

# example :
# ./aigallery.sh "/home/joe/projects/stable-diffusion-webui/outputs/txt2img-images/prompt-wildcards/jumbo/people/beards" "*.png" "man with a " ", volumetric" 4 "Jumbo / People / Beards"

# Let's make the arguments easier to follow
imageDir=$1
imageGlob=$2
promptBefore=$3
promptAfter=$4
columns=$5
pageTitle=$6

# In case you run it twice, remove montage.png first
rm $imageDir/montage.png

# Loop through the files to create the command to run
filenames=''
labels=''
for file in $imageDir/$imageGlob
do
  echo "Adding ${file##*$imageDir}"
  label=${file##*$promptBefore} # trim the before
  label=${label%%$promptAfter*} # trim the after
  labels+="- $label
" # this new line and poor indentation is intentional

  if [ ${#label} -gt 20 ] ; then
    label=$(echo $label|fmt -20)
  fi
  filenames+=" -label '"
  filenames+=$label
  filenames+="' '"
  filenames+=$file
  filenames+="'"
done

# Create the montage
cmd="montage$filenames -tile $columns $imageDir/montage.png"
eval "$cmd"

# Create a README.md to go with it.
echo "# $pageTitle

![$pageTitle Stable Diffusion prompt examples](montage.png '$pageTitle Stable Diffusion prompt examples')

# Prompts used
$labels
" >> $imageDir/README.md
