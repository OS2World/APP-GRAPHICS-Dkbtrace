# Makefile for DKB Ray Tracing Program by David Buck and Aaron Collins
# This file is released to the public domain.
#
#
# MAKE Macros and Such...
#

#***************************************************************
#*
#*       OS/2 2.0 Makefile for use with IBM CSet/2 
#*
#*       By John G. Ham  and John E. Stone
#*
#*                  7/10/92    
#*
#*       Send questions to: johns@cs.umr.edu
#*
#***************************************************************

OBJ     = obj

MACHINE_OBJ	= os2.$(OBJ)

#* C compiler options, use /G3 for 386, /G4 for 486
#* NOTE: code generated with /G3, /G4 will still run on either
#* processor, but runs optimally on the one that the code is generated for.
#* Use /Gf+ with care, make sure that you have enough stack for it,
#* otherwise you'll get Fp-stack overflows..
#* /Gf+ may also decrease fp accuracy.
#* Do NOT use /O+ with this makefile, for some reason /O causes
#* the compiler to bomb on quadrics.c   
#* In addition to this, /O+ seems to cause a General Protection Fault
#* during the parse of the input file(s).  This could possibly be
#* avoided by compiling the .c files in a more individual fashion
#* using /O+ only where it is safe.

CFLAGS=         /G4  -c
CC=icc
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


