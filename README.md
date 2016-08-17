
![](creatorlogo.png)

# Building and running a basic application on Creator Ci40 OpenWrt

#### For more details about the platform please visit the Ci40 [docs.creatordev.io](https://docs.creatordev.io/ci40/) pages
----

## Overview

Ci40-LED-flasher is a basic C application written for OpenWrt on Creator Ci40, its purpose is both to provide a very simple application that will show the board and OpenWrt are working, as well as providing a skeleton reference environment to build and run a C application on the board. When Ci40-LED-flasher is run it will flash the HEARTBEAT LED on and off 10 times.

## Revision History

| revision  | changes from previous revision |
|---------- |------------------------------- |
| 1.1.0     | Process updated to use SDK     |
| 1.0.0     | Initial release                |

## Build Instructions



1. The process detailed below uses the Creator Ci40 OpenWrt SDK on a PC running Ubuntu 16.04.01 LTS. The process of building software using a PC environment that is targetted to run on the Ci40 is known as cross compiling. The cross compiling environment is automatically created when you install the Ci40 OpenWrt SDK
2. This guide assumes that you will be running in the home directory of your Ubuntu environment, that you're running as a user, and that you have a root password to allow sudo commands to be used.
3. Ensure you have the necessary packages in place to support the build process

		$ sudo apt-get update

		$ sudo apt-get install build-essential subversion libncurses5-dev zlib1g-dev gawk gcc-multilib flex git-core gettext libssl-dev 

4. Get a copy of the Creator Ci40 OpenWrt SDK from the Creatordev.io download server
		
		$ wget https://downloads.creatordev.io/pistachio/marduk/OpenWrt-SDK-0.9.4-pistachio-marduk_gcc-5.2.0_musl-1.1.11.Linux-x86_64.tar.bz2
5. Extract the SDK on your local machine

		$ tar jxf OpenWrt-SDK-0.9.4-pistachio-marduk_gcc-5.2.0_musl-1.1.11.Linux-x86_64.tar.bz2
6.  Create a directory for your development code to live in, we suggest creating a "myfeed" directory in your home environment

		$ mkdir myfeed

7. Use git to ake a copy of the source code and makefiles for the Ci40-LED-flasher application from github into your myfeed directory

		$ cd myfeed
		$ git clone https://github.com/Creatordev/Ci40-LED-flasher

7.  Move to your OpenWrt SDK directory and update the feeds file to add your new myfeed directory. The commands below make use of vi to edit a text file, if you're not familiar with vi then use your favourite editor.

		$ cd ~/OpenWrt-SDK-0.9.4-pistachio-marduk_gcc-5.2.0_musl-1.1.11.Linux-x86_64
		$ vi feeds.conf.default
Add the line below substituting USERNAME for your Ubuntu username

		src-link myfeed /home/USERNAME/myfeed
Save and exit the feeds.conf.default file

8. Add the Ci40-LED-flasher package to the feeds

		$ ./scripts/feeds install Ci40-LED-flasher


9. Build the Ci40-LED-flasher application

		$ make package/Ci40-LED-flasher/compile


	The package is now available as an OpenWrt .ipk file, .ipk files can be installed and managed with the OpenWrt OPKG command. 

11. Copy the Ci40-LED-flasher.ipk to the OpenWrt environment running on you Ci40. SCP is used to perform the copy in this example but many other methods are available to copy the file

	* Ensure your Ci40 is running OpenWrt and that you have a command line terminal open

	* Connect the Ci40 to an ethernet cable on the same domain as your build machine

	* In the Ci40 terminal window use OpenWrt's ifconfig command to view the IP address of your Ci40 board

			$ ifconfig


	* The IP address is the inet value of the eth0 section of the displayed data

	>          eth0      Link encap:Ethernet  HWaddr CE:6A:10:55:72:9D

	>                    inet addr:10.40.5.25  Bcast:10.40.5.255  Mask:255.255.255.0


	* In this example the IP address is 10.40.5.25

	* On the build machine use the linux tool scp to copy the Ci40-LED-flasher application to the Ci40 OpenWrt environment

			$ cd bin/pistachio/packages/myfeed
			$ scp Ci40-LED-flasher.ipk root@10.40.5.25:Ci40-LED-flasher.ipk


	If prompted to accept SSH keys to the Ci40 board answer "yes"
	
12. Install the Ci40-LED-flasher application using opkg

		$ opkg install Ci40-LED-flasher.ipk

13. Run the application to view the LED flash on and off 10 times

		$ Ci40-LED-flasher
