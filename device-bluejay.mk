#
# SPDX-FileCopyrightText: 2021 The Android Open-Source Project
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-FileCopyrightText: The Calyx Institute
# SPDX-License-Identifier: Apache-2.0
#

# Kernel
TARGET_LINUX_KERNEL_VERSION := $(RELEASE_KERNEL_ORIOLE_VERSION)
TARGET_KERNEL_DIR ?= device/google/bluejay-kernels/aosp
TARGET_BOARD_KERNEL_HEADERS ?= $(TARGET_KERNEL_DIR)/kernel-headers

# Inherit from gs101
include device/google/gs101/device-shipping-common.mk

# Camera
$(call inherit-product-if-exists, vendor/google/camera/config.mk)

# Pixel Parts
$(call inherit-product-if-exists, packages/apps/PixelParts/device.mk)

# IMS Packages
PRODUCT_PACKAGES += \
    CarrierConfig \
    ims-ext-common \
    ImsServiceEntitlement

# Overlays
DEVICE_PACKAGE_OVERLAYS += \
    device/google/bluejay/overlay-lineage

PRODUCT_PACKAGES += \
    DMServiceOverlayVendorBluejay \
    FrameworkResOverlayProductBluejay \
    FrameworkResOverlayVendorBluejay \
    HbmSVManagerOverlayProductBluejay \
    PixelNfcOverlayBluejay \
    SafetyRegulatoryInfoOverlayProductBluejay \
    SettingsGoogleBluejayOverlay \
    SettingsGoogleOverlayProductBluejay \
    SettingsOverlayG1AZG \
    SettingsOverlayGB17L \
    SettingsOverlayGB62Z \
    SettingsOverlayGX7AS \
    SystemUIGoogleOverlayVendorBluejay

# Properties
TARGET_PRODUCT_PROP += $(DEVICE_PATH)/$(DEVICE_CODENAME)/product.prop
TARGET_VENDOR_PROP += $(DEVICE_PATH)/$(DEVICE_CODENAME)/vendor.prop

# Recovery
PRODUCT_COPY_FILES += \
    device/google/gs101/conf/init.recovery.device.rc:$(TARGET_COPY_OUT_RECOVERY)/root/init.recovery.bluejay.rc

PRODUCT_PACKAGES += \
    init.recovery.bluejay.touch.rc

# Shipping API level
PRODUCT_SHIPPING_API_LEVEL := 32

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(DEVICE_PATH)

# VINTF
DEVICE_MANIFEST_FILE += \
    $(DEVICE_PATH)/vintf/manifest.xml

# Fix Google Camera build errors (uses-library mismatch)
PRODUCT_BROKEN_VERIFY_USES_LIBRARIES := true               
RELAX_USES_LIBRARY_CHECK := true

# sysconfig XML from stock
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/product-sysconfig-stock.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/sysconfig/product-sysconfig-stock.xml
