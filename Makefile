all:
	(cd FBInk; make shared KOBO=1)
	gcc -LFBInk/Release/ -IFBInk main.c -o fbink_xdamage -lX11 -lXext -lXdamage -lXfixes -lfbink
