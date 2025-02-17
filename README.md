# fbink-xdamage
A xclient that listens for xdamage events and refreshes EPD using FBInk

See here for a How-To for Kobos: https://www.mobileread.com/forums/showthread.php?t=336210

## Getting started
1. Clone repository including submodules on a Kobo: 

```
git clone --recurse-submodules https://github.com/tux-linux/fbink-xdamage
```

2. Satisfy dependencies, those are (on Alpine Linux):
 - alpine-sdk
 - xorg-server-dev
 - libx11-dev
 - libxdamage-dev
 - libxfixes-dev
 - probably some more, I'll fix this list once I compile on a fresh Alpine container

3. Build on the Kobo:
```
cd fbink-xdamage
make
```

4. Run:
Start an X session:
```X &```
Then in the shell you compiled fbink-xdamage in start it as root. If you are a user currently, you can run the command like ```sudo su -c "command below"```:
```
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/path/to/fbink-xdamage/FBInk/Release/; env DISPLAY=:0 ./fbink_xdamage
```

5. Run any other xclient

Now you can run any xclient you want (xeyes / mate-session / whatever), you also don't need to be careful with the window title anymore as awesome is out of the way. You only may have to prepend your command with "env DISPLAY=:0", as that might not be exported. The window of whatever you started should appear/update just fine on the epaper screen as long as fbink_xdamage runs.
