CFLAGS=-std=c11 -g -static

self_cc: main.c
	$(CC) -o $@ $? $(LDFLAGS)

test:self_cc
	./test.sh

clean: 
	rm -f self_cc *.o *~ tmp*.

PHONY: test clean