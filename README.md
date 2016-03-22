
![Creator logo] (creatorlogo.png)

# Building and running a basic application on Creator Ci40 Openwrt

#### For more details about the platform please visit [Creator (Ci40) Marduk](https://community.imgtec.com/platforms/creator-ci40/)
----

## Overview

led_flash is a basic C application written for Openwrt on Creator Ci40, its purpose is both to provide a very simple application that will show life of a board and OS as well as providing a skeleton reference environment to build and run a C application on the board. When led_flash is run it will flash the HEARTBEAT LED on and off 10 times.

## Revision History

| revision  | changes from previous revision |
|---------- |------------------------------- |
| 1.0.0     | Initial release                |

## Build Instructions

1) Code is built on the PC that was used to build openwrt for Ci40. The process of building software using a PC environment that is targetted to run on the Ci40 is known as cross compiling. The cross compiling environment is automatically created when you build Openwrt for Ci40 from source code, if Ci40 has been run using pre-built binaries then follow the openwrt.md instructions to build openwrt from source and create the build environment.

2) From the root of the build environment use the existing package directory

	$ cd package

3) Create a subdirectory for your project – led_flash in this case

	$ mkdir led_flash

4) Within led_flash create a src directory

	$ cd led_flash

	$ mkdir src

5) Place the led_flash Openwrt Makefile in the led_flash directory

6) Place the led_flash.c source and the standard c makefile into the src directory

7) Return to the build root directory

8) Add the led_flash package to the feeds

	$ ./scripts/feeds install led_flash

9) Select the led_flash package in the menuconfig

	$ make menuconfig


	Enter the Utilities section and select the led_flash option
	Save the config to the default .config filename and exit menuconfig

10) Build the led_flash application

	$ make package/led_flash/compile

	The led_flash binary is now available in 

	> build_dir/target-mipsel_mips32_musl-1.1.11/led_flash

11) Copy the led_flash binary to the openwrt ci40 environment. SCP is used to perform the copy in this example but many other methods are available to copy the file
	* Ensure your Ci40 is running Openwrt and that you have a command line terminal open
	* Connect the Ci40 to an ethernet cable on the same domain as your build machine
	* Use the ifconfig command in Openwrt to view the IP address of your Ci40 board

		$ ifconfig
	
On the build machine use the linux tool scp to copy the led_flash application to the Ci40 Openwrt environment

_Insert scp instructions to copy led_flash to /bin here_
	
12) The led_flash application is now ready to run on your Ci40 Openwrt environment

	$ ./led_flash