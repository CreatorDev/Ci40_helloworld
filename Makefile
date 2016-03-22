##############################################
# OpenWrt Makefile for led_flash program
#
##############################################

include $(TOPDIR)/rules.mk

# Name and release number of this package
PKG_NAME:=led_flash
PKG_RELEASE:=1


# This specifies the directory where we're going to build the program.  
# The root build directory, $(BUILD_DIR), is by default the build_mipsel 
# directory in your OpenWrt SDK directory
PKG_BUILD_DIR := $(BUILD_DIR)/$(PKG_NAME)

include $(INCLUDE_DIR)/package.mk

define Package/led_flash
	SECTION:=utils
	CATEGORY:=Utilities
	TITLE:=Flashes the heartbeat LED
	Package/PKG_NAME/description:=\
	Simple app to get people started
endef


# Specify what needs to be done to prepare for building the package.
# In our case, we need to copy the source files to the build directory.
# This is NOT the default.  The default uses the PKG_SOURCE_URL and the
# PKG_SOURCE which is not defined here to download the source from the web.
# In order to just build a simple program that we have just written, it is
# much easier to do it this way.
define Build/Prepare
	mkdir -p $(PKG_BUILD_DIR)
	$(CP) ./src/* $(PKG_BUILD_DIR)/
endef

define Package/led_flash/install
	$(INSTALL_DIR) $(1)/bin
#	$(INSTALL_BIN) $(PKG_BUILD_DIR)/led_flash $(1)/bin/
endef


# This line executes the necessary commands to compile our program.
# The above define directives specify all the information needed, but this
# line calls BuildPackage which in turn actually uses this information to
# build a package.
$(eval $(call BuildPackage,led_flash))

