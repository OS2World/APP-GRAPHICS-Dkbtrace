
******************************************************
  Building Dkbtrace under OS/2....
******************************************************

   This file has all of the information needed in order to
compile dkbtrace 2.12 for OS/2 2.0 using the IBM C Set/2.
If the bugs in file I/O are removed from GCC 2.1, then I 
will make a similar port of dkbtrace for it too.
When I tried the current GCC 2.1 compiler, it produced 
code that ran, but the file buffering is absolute trash, 
the program completes without properly closing the files.
This is something related to the GCC compiler, and until it is
fixed, I'm not going to bother with hacking dkb to run with
GCC's bugs.

Now back to the issue... 
To compile dkbtrace version 2.12 for OS/2 with the IBM compiler,
You need to do just a few things.
First, get the DKB212SR.TAR.Z file from somewhere (the regular dkb
sources...) and uncompress and untar it. 
Unzip this set of files, into the same directory that you untarred the 
dkb212sr.tar.Z into.

now run os2conf.cmd

This will do the following:
copy os2conf.h config.h
copy os2ibmc.mak makefile

Once this is done, just run nmake, and this
should build dkbtrace.

GCC 2.1
**********
If you would like to try using GCC 2.1, and make the necessary fixes to
the file I/O in either dkb or gcc, then copy os2gcc.mak to makefile
and use gnu make (the emx port available from hobbes...)


Testing it all out
********************
To try out your newly compiled raytracer (or the executable 
conatined in the package) run test.cmd 
I have included a sample file called sunset.dat

Getting more DKB files, sources, pictures.
*******************************************
The home archive for DKBtrace is alfred.ccs.carleton.ca
(at least it was the last time I checked)
Use anonymous ftp, and it should be in /pub/dkbtrace/dkb2.12
There were a couple other ports to OS/2, but none that I am aware
of are 2.0 specific or 32bit.

Files are:  dkb212sr.tar.Z  - sources
            dkb212dt.tar.Z  - Many more data files to trace :-)
         dkb212.1side.ps.Z  - Doc files in PS. 
            dkb212dc.tar.Z  - Docs in ascii (I think)

There aare also .zoo versions of most of the above files in the 
same directory.

There are some other utilities etc available in the same place,
but they are too numerous to list, the above two will get you started.


For questions or information about this and the other included files and
their usage, please contact  John E. Stone via email at:

internet:          johns@cs.umr.edu
  bitnet:          s099466@umrvma

Hope you enjoy DKB :-)

       John Stone

 
