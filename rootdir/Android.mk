LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_MODULE       := init.foles.rc
LOCAL_MODULE_TAGS  := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_SRC_FILES    := etc/init.foles.rc
LOCAL_MODULE_PATH  := $(TARGET_OUT_VENDOR_ETC)/init
LOCAL_VENDOR_MODULE    := true
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE       := init.gbmods.sh
LOCAL_MODULE_TAGS  := optional
LOCAL_MODULE_CLASS := EXECUTABLES
LOCAL_SRC_FILES    := bin/init.gbmods.sh
LOCAL_VENDOR_MODULE    := true
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE       := init.mmi.overlay.rc
LOCAL_MODULE_TAGS  := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_SRC_FILES    := etc/init.mmi.overlay.rc
LOCAL_MODULE_PATH  := $(TARGET_OUT_VENDOR_ETC)/init/hw
include $(BUILD_PREBUILT)

# Recovery doesn't mount /vendor, so the goodix touch config blob is
# unreachable there and the kernel's firmware loader times out, leaving touch
# dead. ueventd searches /etc/firmware/ first, and in the recovery ramdisk
# /etc is a symlink to /system/etc, so the copy has to go there - installing
# to $(TARGET_RECOVERY_ROOT_OUT)/etc fails outright at build time because
# that symlink points at an absolute path that doesn't exist on the host.
#
# This also has to be a module rather than a PRODUCT_COPY_FILES entry:
# TARGET_RECOVERY_ROOT_OUT is defined in envsetup.mk, which runs *after*
# product config is parsed, so in device.mk it expands to empty and the file
# silently lands in $PRODUCT_OUT/etc/firmware instead.
include $(CLEAR_VARS)
LOCAL_MODULE       := goodix_cfg_group2.bin.recovery
LOCAL_MODULE_STEM  := goodix_cfg_group2.bin
LOCAL_MODULE_TAGS  := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_SRC_FILES    := ../../../../vendor/motorola/foles/proprietary/vendor/firmware/goodix_cfg_group2.bin
LOCAL_MODULE_PATH  := $(TARGET_RECOVERY_ROOT_OUT)/system/etc/firmware
include $(BUILD_PREBUILT)
