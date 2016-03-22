Instructions to build and run led_flash on ci40 openwrt
1)	Code is built on the PC that was used to build openwrt for Ci40. If Ci40 has been run using binaries then follow the openwrt.md instructions to create the build environment.
2)	From the root of the build environment use the existing package directory
3)	Create a subdirectory for your project – led_flash in this case
4)	Within led_flash create a src directory
5)	Within src copy the led_flash.c source and the standard c makefile
6)	In the helloworld directory (one level up from src) copy the led_flash Openwrt Makefile
7)	Return to the build root directory
8)	Add the helloworld package to the feeds
a.	./scripts/feeds install led_flash
9)	Select the helloworld package in the menuconfig
a.	Start the menu config process with the command make menuconfig
b.	From the Utilities section select the led_flash option
c.	Save the config to the default .config filename and exit menuconfig
10)	Build the led_flash application
a.	make package/led_flash/compile
b.	The led_flash binary is now available in 
build_dir/target-mipsel_mips32_musl-1.1.11/led_flash
11)	Copy the led_flash binary to the openwrt ci40 environment
a.	Copy the file to a linux formatted pendrive (can be the openwrt boot pendrive if in use), or
b.	Use Winscp (windows), Secpanel (Ubuntu), or a different scp client to transfer the file to the Ci40 over a network link, or
c.	Another method that you’re familiar with
12)	Run the app
