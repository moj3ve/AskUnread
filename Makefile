ARCHS = arm64 arm64e
INSTALL_TARGET_PROCESSES = LINE

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = AskUnread

AskUnread_FILES = Tweak.xm
AskUnread_CFLAGS = -fobjc-arc
AskUnread_EXTRA_FRAMEWORKS = Cephei
AskUnread_LIBRARIES = colorpicker
include $(THEOS_MAKE_PATH)/tweak.mk

SUBPROJECTS += askunread

include $(THEOS_MAKE_PATH)/aggregate.mk
