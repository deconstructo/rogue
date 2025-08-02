#
# Copyright (c) 1987 Regents of the University of California.
# All rights reserved.
#
# Redistribution and use in source and binary forms are permitted
# provided that this notice is preserved and that due credit is given
# to the University of California at Berkeley. The name of the University
# may not be used to endorse or promote products derived from this
# software without specific written prior permission. This software
# is provided ``as is'' without express or implied warranty.
#

PREFIX		= /usr/local
MANDIR		= ${PREFIX}/share/man
MAN1DIR		= ${MANDIR}/man1
GAMESDIR	= ${PREFIX}/games
BINDIR		= ${GAMESDIR}/bin
LIBDIR		= ${GAMESDIR}/lib


CFLAGS		= -DUNIX  -DLINUX -DUNIX_SYSV -Wall -DCROSS -g -O6
LDFLAGS         = -g
LIBS            = -lncurses

HFILES		= rogue.h

OBJS            = 	\
                  hit.o		\
                  init.o	\
                  inventory.o	\
                  level.o	\
                  machdep.o	\
                  main.o	\
                  message.o	\
                  monster.o	\
                  move.o	\
                  object.o	\
                  pack.o	\
                  play.o	\
                  random.o	\
                  ring.o	\
                  room.o	\
                  save.o	\
                  score.o	\
                  spec_hit.o	\
                  throw.o	\
                  trap.o	\
                  use.o		\
                  zap.o
MAN		= rogue.1


all:            rogue ${MAN}

rogue:          ${OBJS} ${HFILES}
		${CC} ${LDFLAGS} -o $@ ${OBJS} ${LIBS}

install:	all
		install -o games -g games -s -m 2755 rogue ${BINDIR}
		install ${MAN} ${MAN1DIR}

clean:
		rm -f *.o rogue *~
