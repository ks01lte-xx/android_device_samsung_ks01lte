#
# Copyright (C) 2014-2016 The CyanogenMod Project
# Copyright (C) 2017-2018 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += $(LOCAL_PATH)
QCOM_SOONG_NAMESPACE := $(LOCAL_PATH)/hardware

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit from ks01lte device
$(call inherit-product, device/samsung/ks01lte/device.mk)

# Inherit some common LineageOS stuff.
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := ks01lte
PRODUCT_NAME := lineage_ks01lte
PRODUCT_BRAND := samsung
PRODUCT_MANUFACTURER := samsung

PRODUCT_MODEL := GT-I9506

PRODUCT_GMS_CLIENTID_BASE := android-samsung

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME=ks01ltexx \
    TARGET_DEVICE=ks01lte \
    PRIVATE_BUILD_DESC="ks01ltexx-user 5.0.1 LRX22C I9506XXUDRB1 release-keys"

BUILD_FINGERPRINT := samsung/ks01ltexx/ks01lte:5.0.1/LRX22C/I9506XXUDRB1:user/release-keys