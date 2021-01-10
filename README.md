# fbink-xdamage
A xclient that listens for xdamage events and refreshes EPD using FBInk

## Getting started
1. Clone repository including submodules on a Kindle: 

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

First, in another shell, stop the running Kindle GUI including X, which also includes awesome windowmanager that usually caters for EPD refreshes. Then start X without any windowmanager:
```
stop lab126_gui
stop x
X
```
Then in the shell you compiled fbink-xdamage in start it as root. If you are a user currently, you can run the command like ```sudo su -c "command below"```:
```
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/path/to/fbink-xdamage/FBInk/Release/; env DISPLAY=:0 ./fbink_xdamage
```

5. Run any other xclient

Now you can run any xclient you want (xeyes / mate-session / whatever), you also don't need to be careful with the window title anymore as awesome is out of the way. You only may have to prepend your command with "env DISPLAY=:0", as that might not be exported. The window of whatever you started should appear/update just fine on the epaper screen as long as fbink_xdamage runs.
