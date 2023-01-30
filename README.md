# Stable Diffusion AI Prompt Examples

## What is this?
Prompts can be hard.  There's so many tokens to try and it can take a long time to figure out which one will get you what you're after.  I wanted to have a place where I could easily see examples of different tokens in use, so here we are.

## How to use
Star and/or bookmark this page so you can find it later.  Then browse the folders to the prompts you're after or just search this repository using the GitHub search box at the top left.  These folders are organized following the structure in the [Wildcards](https://github.com/AUTOMATIC1111/stable-diffusion-webui-wildcards) they came from.

## How to contribute
1. Fork this repository
2. Generate examples using the format below (or close to it) and move them to their own directory
3. Create a folder in the appropriate place in this repository
4. Run the script following the examples in the script to create a montage and README for the example set
5. Copy the `montage.png` and `README.md` into the new folder, commit, and open a pull request to have your example added.

![Settings top half](images/settings1.png "Settings Top Half")
![Settings bottom half](images/settings2.png "Settings Bottom Half")

## Tips
- 512 x 512 should be fine, since they all get shrunk down anyway
- I'm using RealisticVision, but use whatever works as long as the resulting montage gives a good idea of what the prompt adds
- Try to be generic in your prompt tokens that are not the wildcard so it can add the most to the image.
- If you get an error about files not found, rename any generated images with apostrophes or quotation marks in them and run it again.
