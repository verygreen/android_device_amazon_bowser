#
# Copyright (C) 2011 The CyanogenMod Project
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

TARGET_SCREEN_WIDTH := 1920
TARGET_SCREEN_HEIGHT := 1200

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_tablet_wifionly.mk)

# Inherit device configuration for bowser
$(call inherit-product, device/amazon/bowser/full_bowser.mk)

DEVICE_PACKAGE_OVERLAYS += device/amazon/bowser/overlay/cm

TARGET_HAS_CUSTOM_LIBION := true

PRODUCT_NAME := cm_bowser
PRODUCT_DEVICE := bowser
PRODUCT_BRAND := Android
PRODUCT_MODEL := Amazon Kindle Fire HD
PRODUCT_MANUFACTURER := Amazon
PRODUCT_RELEASE_NAME := KindleFireHD



