include theos/makefiles/common.mk
export GO_EASY_ON_ME=1
TWEAK_NAME = back2first
back2first_FILES = Tweak.xm
back2first_FRAMEWORKS = UIKit CoreGraphics

include $(THEOS_MAKE_PATH)/tweak.mk
