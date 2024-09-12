# Copyright (C) 2014 The CyanogenMod Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit from ks01lte device
$(call inherit-product, device/samsung/ks01lte/device.mk)

# Set those variables here to overwrite the inherited values.
PRODUCT_NAME := full_ks01lte
PRODUCT_DEVICE := ks01lte
PRODUCT_MODEL := ks01lte
PRODUCT_BRAND := samsung
PRODUCT_MANUFACTURER := samsung
