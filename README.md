# reddit-wallpaper
A script that downloads a wallpaper from Reddit and manipulates config files to set a snazzy theme.

## Dependencies
  - [jq](https://github.com/stedolan/jq) - A command-line json processor for getting image files out of Reddit json data.
  - wget - This should already be on most distros, but this is to download Reddit photos and JSON.
  - [pywal](https://github.com/dylanaraps/pywal) - An easy way to set color schemes from a wallpaper.
  - [pywalfox](https://github.com/Frewacom/pywalfox) - A way to set firefox colors from a pywal config from the command line.
    - If you don't want automatic Firefox theming, just comment out the last line of the script.

## Installing
I made this for i3wm, but you can theoretically use any wm or de you want.

All you have to do is put this script in a spot to remember, and configure your window manager or desktop environment to run this at startup.
You can also configure the de or wm to run this at the press of a keyboard combo.

## Configuration
The SUBREDDITS variable contains a list of all of the subreddits it should pull from.  You can add or delete subreddits, but just make sure that the urls output Reddit json and not html.
Wal's command line arguments can be changed.  On the script, one argument is to change urxvt transparency to 90% opaque.

## Notes
  - This deletes pywal cache, Xresources, and ~/.wallpaper.png
  - If you start firefox after running the script, you will have to update pywalfox's color schemes.  I got around this with this simple bodge:
```
#!/bin/sh
{
  sleep 3
  pywalfox update
}
firefox
```
and setting my i3 config to run this instead of normal firefox.
