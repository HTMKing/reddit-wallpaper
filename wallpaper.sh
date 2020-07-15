#!/bin/sh

### CONFIG ###
SUBREDDITS="https://www.reddit.com/r/wallpapers/hot/.json?count=100
https://www.reddit.com/r/earthporn/hot/.json?count=100
https://www.reddit.com/r/wallpaper/hot/.json?count=100
https://www.reddit.com/r/skyporn/hot/.json?count=100
https://www.reddit.com/r/weatherporn/hot/.json?count=100
https://www.reddit.com/r/lakeporn/hot/.json?count=100
https://www.reddit.com/r/villageporn/hot/.json?count=100
https://www.reddit.com/r/cityporn/hot/.json?count=100
https://www.reddit.com/r/beachporn/hot/.json?count=100
https://www.reddit.com/r/waterporn/hot/.json?count=100"


# Clear wal cache
rm -rf ~/.cache/wal/*

# Get wallpaper image
{ for SUBREDDIT in $SUBREDDITS; do wget -O - -q $SUBREDDIT | jq '.data.children[] |.data.url'; done } | shuf | head -n1 | xargs wget -O ~/.wallpaper.png

# Set wallpaper and change colors
wal -i ~/.wallpaper.png -a 90

# Move Xresources to ~ and xrdb
cp ~/.cache/wal/colors.Xresources ~/.Xresources
xrdb ~/.Xresources

# Set firefox theme
pywalfox update
