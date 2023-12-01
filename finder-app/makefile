
Target = writer


CROSS_COMPILE= 
Cflags= -Wall -Os


SRCS = writer.c
OBJS = writer.o

all:
	$(CROSS_COMPILE)gcc $(Cflags) -c $(SRCS) -o $(OBJS)
	$(CROSS_COMPILE)gcc $(Cflags) -o $(Target) $(OBJS) 

clean:
	rm $(Target) $(SRCS:.c=.o)
