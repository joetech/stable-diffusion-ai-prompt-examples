#!/bin/bash
# Usage:
#   ./process.sh <source directory> <destination directory> <filename extension> <page name> <prompt before> <prompt after>
#
# Example:
#   ./process.sh /home/joe/projects/stable-diffusion-webui/outputs/txt2img-images/prompt-wildcards/artists/european-art/modern/divisionism ./examples/artists/european-art/modern/divisionism ".png" "Artists / European Art / Modern / Divisionism" "art by " ".png"
#

sourceDir=$1
destDir=$2
extension=$3
pageName=$4
promptBefore=$5
promptAfter=$6

clear
./aigallery.sh "$sourceDir" "*$extension" "$promptBefore" "$promptAfter" 4 "$pageName" && mkdir -p $destDir && cp $sourceDir/montage.png $destDir && cp $sourceDir/README.md $destDir
git add .
git commit -am "Added gallery for $pageName"
git push
