#
# Copyright (C) 2020 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from sm8350-common
$(call inherit-product, device/xiaomi/sm8350-common/common.mk)

# Inherit proprietary targets
$(call inherit-product-if-exists, vendor/xiaomi/venus/venus-vendor.mk)

# Boot animation
TARGET_SCREEN_HEIGHT := 3200
TARGET_SCREEN_WIDTH := 1440

# Overlays
DEVICE_PACKAGE_OVERLAYS += \
    $(LOCAL_PATH)/overlay \
    $(LOCAL_PATH)/overlay-aosp

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)

PRODUCT_ADB_KEYS := $(LOCAL_PATH)/venus_debug.pub

ifeq ($(wildcard $(PRODUCT_ADB_KEYS)),)
  $(warning ========================)
  $(warning The adb key for this release)
  $(warning )
  $(warning   $(PRODUCT_ADB_KEYS))
  $(warning )
  $(warning does not exist. Most likely something has changed and a new adb key needs to be generated.)
  $(warning ========================)
  $(error done)
endif
