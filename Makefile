YFLAGS=-d
PROGRAM=calc
OBJS=calcparse.tab.o lex.yy.o fmath.o
SRCS=calcparse.tab.c lex.yy.c fmath.c
CC=gcc

all: $(PROGRAM)

.c.o: $(SRCS)
	$(CC) -c $*.c -o $@ -O

calcparse.tab.c: calcparse.y
	bison -d $(YFLAGS) $<

lex.yy.c: lex.l
	flex lex.l

calc:	$(OBJS)
	$(CC) $(OBJS) -o $@ -lfl -lm

clean:;	rm -f $(OBJS) core *~ \#* *.o $(PROGRAM) \
	y.* lex.yy.* calcparse.tab.*

