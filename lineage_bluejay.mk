#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-FileCopyrightText: The Calyx Institute
# SPDX-License-Identifier: Apache-2.0
#

# Inherit some common stuff
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

# Avium Flags
AVIUM_VERSION_APPEND_TIME_OF_DAY := true
AVIUM_MAINTAINER := srly8

# Settings
AVIUM_SETTINGS_SOC_MODEL_NAME := Google Tensor Gen 1
AVIUM_SETTINGS_DEVICE_CODENAME := Bluejay

# GMS
WITH_GMS := true

# Google IME
TARGET_INCLUDE_GOOGLEIME := true
TARGET_GOOGLEIME_OVERRIDE_IME := true

# Spoof Props
AVIUM_FORCE_SET_FAKE_PROP := true

# Inherit device configuration
DEVICE_CODENAME := bluejay
DEVICE_PATH := device/google/bluejay
VENDOR_PATH := vendor/google/bluejay
$(call inherit-product, $(DEVICE_PATH)/aosp_$(DEVICE_CODENAME).mk)

# Device identifier. This must come after all inclusions
PRODUCT_BRAND := google
PRODUCT_MODEL := Pixel 6a
PRODUCT_NAME := lineage_$(DEVICE_CODENAME)

# Boot animation
TARGET_SCREEN_HEIGHT := 2400
TARGET_SCREEN_WIDTH := 1080

PRODUCT_BUILD_PROP_OVERRIDES += \
    BuildDesc="bluejay-user 16 BP4A.251205.006 14401865 release-keys" \
    BuildFingerprint=google/bluejay/bluejay:16/BP4A.251205.006/14401865:user/release-keys \
    DeviceProduct=$(DEVICE_CODENAME)

$(call inherit-product, $(VENDOR_PATH)/$(DEVICE_CODENAME)-vendor.mk)
