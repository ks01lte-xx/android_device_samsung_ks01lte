#
# Copyright (C) 2014-2016 The CyanogenMod Project
# Copyright (C) 2017-2018 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += $(LOCAL_PATH)
QCOM_SOONG_NAMESPACE := $(LOCAL_PATH)/hardware

# Shipping API level
$(call inherit-product, $(SRC_TARGET_DIR)/product/product_launched_with_k.mk)

# Inherit some common LineageOS stuff.
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

$(call inherit-product, device/samsung/ks01lte/full_ks01lte.mk)

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := ks01lte
PRODUCT_NAME := lineage_ks01lte

PRODUCT_MODEL := GT-I9506

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME=ks01ltexx \
    TARGET_DEVICE=ks01lte \
    PRIVATE_BUILD_DESC="ks01ltexx-user 5.0.1 LRX22C I9506XXSDPL2 release-keys"

BUILD_FINGERPRINT := samsung/ks01ltexx/ks01lte:5.0.1/LRX22C/I9506XXSDPL2:user/release-keys