SOURCES=base.c settings.c sokoban.c sokoban2.c solver.c savitch.c solution.c
OBJECTS=$(SOURCES:.c=.o)

DEPS=gtk+-2.0 libpcre sqlite3
CFLAGS=`pkg-config --cflags $(DEPS)`
LIBS=-lz `pkg-config --libs $(DEPS)`

all: usokoban $(OBJECTS)

usokoban: $(OBJECTS)
	gcc $(LIBS) $(OBJECTS) -o usokoban

%.o: %.c
	gcc -c $(CFLAGS) $< -o $@

clean:
	rm -f $(OBJECTS)
	rm -f usokoban
