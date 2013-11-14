# Makefile for DKB Ray Tracing Program by David Buck and Aaron Collins
# This file is released to the public domain.
#
#
# MAKE Macros and Such...
#

#***************************************************************
#*
#*    EXPERIMENTAL OS/2 2.0 Makefile for use with GCC 2.1 
#*
#*       By John G. Ham  and John E. Stone
#*
#*                  7/11/92    
#*
#*       Send questions to: johns@cs.umr.edu
#*
#***************************************************************

.SUFFIXES: 	.exe .obj .c

OBJ     = obj

MACHINE_OBJ	= os2.$(OBJ)

#* NOTE:  I have used this makefile to successfully compile
#*      dkbtrace version 2.12 with GCC 2.1 
#*      HOWEVER, GCC 2.1 seems to have problems with file I/O 
#*      specifically flushing the buffer in a reasonable amount
#*      of time, or at all.  When the +d option is invoked,
#*      the line messages are not flushed line by line as they 
#*      should be, instead they build up, and all pop out at once.
#*      Also the output .tga file doesn't get flushed before
#*      it is closed most of the time, meaning that you lose
#*      the last part of the picture most of the time.
#*      This could be fixed by adding fflush() calls into 
#*      some of the core parts of dkb, but I'd rather not hack up
#*      David Buck's code, I would rather that someone fixes
#*      The GCC compiler.

CFLAGS=    -c
CC=gcc
# Make's implicit rules for making a .o file from a .c file...
#
.c.obj :
	$(CC) $(CFLAGS) $*.c


DKBOBJS = trace.$(OBJ) render.$(OBJ) tokenize.$(OBJ) parse.$(OBJ) \
	  objects.$(OBJ) spheres.$(OBJ) quadrics.$(OBJ) lighting.$(OBJ) \
	  prioq.$(OBJ) texture.$(OBJ) matrices.$(OBJ) csg.$(OBJ) dump.$(OBJ) \
	  colour.$(OBJ) viewpnt.$(OBJ) ray.$(OBJ) planes.$(OBJ) iff.$(OBJ) \
	  gif.$(OBJ) gifdecod.$(OBJ) triangle.$(OBJ) raw.$(OBJ) targa.$(OBJ) \
          quartics.$(OBJ) vect.$(OBJ) $(MACHINE_OBJ)


dkbtrace: $(DKBOBJS)
	link386 @os2.lnk 

trace.$(OBJ) : trace.c dkbproto.h frame.h vector.h config.h

tokenize.$(OBJ) : tokenize.c dkbproto.h frame.h config.h

parse.$(OBJ) : parse.c dkbproto.h frame.h config.h

render.$(OBJ) : render.c dkbproto.h frame.h vector.h config.h

lighting.$(OBJ) : lighting.c dkbproto.h frame.h vector.h config.h

prioq.$(OBJ) : prioq.c dkbproto.h frame.h config.h

texture.$(OBJ) : texture.c dkbproto.h frame.h vector.h config.h

objects.$(OBJ) : objects.c dkbproto.h frame.h vector.h config.h

spheres.$(OBJ) : spheres.c dkbproto.h frame.h vector.h config.h

planes.$(OBJ) : planes.c dkbproto.h frame.h vector.h config.h

quartics.$(OBJ) : quartics.c dkbproto.h frame.h vector.h config.h

vect.$(OBJ) : vect.c dkbproto.h frame.h config.h

quadrics.$(OBJ) : quadrics.c dkbproto.h frame.h vector.h config.h

matrices.$(OBJ) : matrices.c dkbproto.h frame.h vector.h config.h

csg.$(OBJ) : csg.c dkbproto.h frame.h vector.h config.h

colour.$(OBJ) : colour.c dkbproto.h frame.h config.h

viewpnt.$(OBJ) : viewpnt.c dkbproto.h frame.h vector.h config.h

ray.$(OBJ) : ray.c dkbproto.h frame.h vector.h config.h

iff.$(OBJ) : iff.c dkbproto.h frame.h config.h

gif.$(OBJ) : gif.c dkbproto.h frame.h config.h

gifdecod.$(OBJ) : gifdecod.c dkbproto.h frame.h config.h

raw.$(OBJ) :	raw.c dkbproto.h frame.h config.h

triangle.$(OBJ) : triangle.c dkbproto.h frame.h vector.h config.h

amiga.$(OBJ) :	amiga.c dkbproto.h frame.h config.h

dump.$(OBJ) :	dump.c dkbproto.h frame.h config.h


