# build led_flash executable when user executes "make"
led_flash: led_flash.o
	$(CC) $(LDFLAGS) led_flash.o -o led_flash
led_flash.o: led_flash.c
	$(CC) $(CFLAGS) -c led_flash.c

# remove object files and executable when user executes "make clean"
clean:
	rm *.o led_flash

