##############################################
# OpenWrt Makefile for Ci40_helloworld 
# This example is provided along with a guide
# for building OpenWrt packages using the
# Creator Ci40 OpenWrt SDK
##############################################

include $(TOPDIR)/rules.mk

# Name and release number of this package
PKG_NAME:=Ci40_helloworld
PKG_VERSION:=1.0.0
PKG_RELEASE:=1

PKG_BUILD_DIR := $(BUILD_DIR)/$(PKG_NAME)

include $(INCLUDE_DIR)/package.mk

define Package/Ci40_helloworld
	SECTION:=utils
	CATEGORY:=Utilities
	TITLE:=Prints a helloworld message
endef

define Package/PKG_NAME/description
	Simple OpenWrt app
endef

define Build/Prepare
	mkdir -p $(PKG_BUILD_DIR)
	$(CP) ./src/* $(PKG_BUILD_DIR)/
endef

define Package/Ci40_helloworld/install
	$(INSTALL_DIR) $(1)/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/Ci40_helloworld $(1)/bin/
endef

$(eval $(call BuildPackage,Ci40_helloworld))

