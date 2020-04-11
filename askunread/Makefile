ARCHS = arm64 arm64e
include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = AskUnread

AskUnread_FILES = AskUnreadRootListController.m ChangeButtonListController.m CurrentButtonListController.m 
AskUnread_INSTALL_PATH = /Library/PreferenceBundles
AskUnread_FRAMEWORKS = UIKit
AskUnread_PRIVATE_FRAMEWORKS = BackBoardServices Preferences
AskUnread_EXTRA_FRAMEWORKS = Cephei CepheiPrefs
AskUnread_CFLAGS = -fobjc-arc

AskUnread_LIBRARIES = colorpicker

include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/AskUnread.plist$(ECHO_END)
