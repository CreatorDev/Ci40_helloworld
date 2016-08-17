# build Ci40_helloworld executable when user executes "make"
Ci40_helloworld: Ci40_helloworld.o
	$(CC) $(LDFLAGS) Ci40_helloworld.o -o Ci40_helloworld
Ci40_helloworld.o: Ci40_helloworld.c
	$(CC) $(CFLAGS) -c Ci40_helloworld.c

# remove object files and executable when user executes "make clean"
clean:
	rm *.o Ci40_helloworld

