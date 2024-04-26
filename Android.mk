LOCAL_PATH := $(call my-dir)

include $(call all-subdir-makefiles,$(LOCAL_PATH))

include $(CLEAR_VARS)

FIRMWARE_MODEM_MOUNT_POINT := $(TARGET_OUT_VENDOR)/firmware-modem
FIRMWARE_MOUNT_POINT := $(TARGET_OUT_VENDOR)/firmware_mnt

$(FIRMWARE_MODEM_MOUNT_POINT):
	@echo "Creating $(FIRMWARE_MODEM_MOUNT_POINT)"
	@mkdir -p $(TARGET_OUT_VENDOR)/firmware-modem

$(FIRMWARE_MOUNT_POINT):
	@echo "Creating $(FIRMWARE_MOUNT_POINT)"
	@mkdir -p $(TARGET_OUT_VENDOR)/firmware_mnt

ALL_DEFAULT_INSTALLED_MODULES += \
	$(FIRMWARE_MODEM_MOUNT_POINT) \
	$(FIRMWARE_MOUNT_POINT)
