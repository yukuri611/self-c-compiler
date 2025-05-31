CFLAGS=-std=c11 -g -static
SRCS=$(wildcard *.c)
OBJS=$(SRCS:.c=.o)

self_cc: $(OBJS)
	$(CC) -o $@ $(OBJS) $(LDFLAGS)

$(OBJS): self_cc.h

test:self_cc
	./test.sh

clean: 
	rm -f self_cc *.o *~ tmp*.

PHONY: test clean
