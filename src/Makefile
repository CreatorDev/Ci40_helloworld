# build Ci40-LED-flasher executable when user executes "make"
Ci40-LED-flasher: Ci40-LED-flasher.o
	$(CC) $(LDFLAGS) Ci40-LED-flasher.o -o Ci40-LED-flasher
Ci40-LED-flasher.o: Ci40-LED-flasher.c
	$(CC) $(CFLAGS) -c Ci40-LED-flasher.c

# remove object files and executable when user executes "make clean"
clean:
	rm *.o Ci40-LED-flasher

