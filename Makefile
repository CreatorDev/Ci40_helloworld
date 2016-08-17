##############################################
# OpenWrt Makefile for Ci40-LED-flasher 
# This example is provided along with a guide
# for building OpenWrt packages using the
# Creator Ci40 OpenWrt SDK
##############################################

include $(TOPDIR)/rules.mk

# Name and release number of this package
PKG_NAME:=Ci40-LED-flasher
PKG_VERSION:=1.1.0
PKG_RELEASE:=1

PKG_BUILD_DIR := $(BUILD_DIR)/$(PKG_NAME)

include $(INCLUDE_DIR)/package.mk

define Package/Ci40-LED-flasher
	SECTION:=utils
	CATEGORY:=Utilities
	TITLE:=Flashes the heartbeat LED
endef

define Package/PKG_NAME/description
	Simple OpenWrt app
endef

define Build/Prepare
	mkdir -p $(PKG_BUILD_DIR)
	$(CP) ./src/* $(PKG_BUILD_DIR)/
endef

define Package/Ci40-LED-flasher/install
	$(INSTALL_DIR) $(1)/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/Ci40-LED-flasher $(1)/bin/
endef

$(eval $(call BuildPackage,Ci40-LED-flasher))

