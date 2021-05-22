TARGET := iphone:clang:latest:14.0
PACKAGE_VERSION = 1.0.0
ARCHS = arm64 arm64e

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = AppLibraryforiPad

AppLibraryforiPad_FILES = Tweak.x
AppLibraryforiPad_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk
