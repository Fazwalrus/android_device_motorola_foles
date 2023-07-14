#
# Copyright (C) 2017-2020 The LineageOS Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit from foles device
$(call inherit-product, device/motorola/foles/device.mk)

# Inherit some common Pixel Experience stuff.
$(call inherit-product, vendor/aosp/config/common_full_phone.mk)

# Device identifier. This must come after all inclusions.
PRODUCT_NAME := aosp_foles
PRODUCT_DEVICE := foles
PRODUCT_BRAND := motorola
PRODUCT_MODEL := Moto Z4
PRODUCT_MANUFACTURER := motorola

PRODUCT_AAPT_CONFIG := xxxhdpi
PRODUCT_AAPT_PREF_CONFIG := xxxhdpi

# Boot animation
TARGET_SCREEN_HEIGHT := 2340
TARGET_SCREEN_WIDTH := 1080

# Build info
BUILD_FINGERPRINT := "motorola/foles/foles:10/QPFS30.130-15-11-5/dfd59:user/release-keys"
PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME=foles_retail \
    PRIVATE_BUILD_DESC="foles-user 10 QPFS30.130-15-11-5 dfd59 release-keys"

PRODUCT_GMS_CLIENTID_BASE := android-motorola
