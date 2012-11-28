# Copyright (C) 2007 The Android Open Source Project
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

# BoardConfig.mk
#
# Product-specific compile-time definitions.
#

USE_CAMERA_STUB := false
BOARD_USES_GENERIC_AUDIO := false
#BOARD_HAVE_FAKE_GPS := true
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_BCM := true

TI_OMAP4_CAMERAHAL_VARIANT := false

# inherit from the proprietary version
-include vendor/amazon/bowser/BoardConfigVendor.mk

# Processor 
TARGET_BOARD_PLATFORM := omap4
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_SMP := true
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
ARCH_ARM_HAVE_TLS_REGISTER := true
TARGET_GLOBAL_CFLAGS += -mtune=cortex-a8 -mfpu=neon -mfloat-abi=softfp
TARGET_GLOBAL_CPPFLAGS += -mtune=cortex-a8 -mfpu=neon -mfloat-abi=softfp
TARGET_BOOTLOADER_BOARD_NAME := bowser

# Kernel/Boot
BOARD_KERNEL_BASE := 0x80000000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_KERNEL_CMDLINE := console=ttyO2,115200n8 mem=1G vmalloc=256M init=/init androidboot.console=ttyO2 androidboot.hardware=bowser
TARGET_NO_BOOTLOADER := true
TARGET_NO_RADIOIMAGE := true

# Filesystem
TARGET_USERIMAGES_USE_EXT4 := true
BOARD_BOOTIMAGE_PARTITION_SIZE := 8388608
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 8388608
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 929038336
BOARD_USERDATAIMAGE_PARTITION_SIZE := 12949893120
BOARD_FLASH_BLOCK_SIZE := 131072

# WIFI
BOARD_WPA_SUPPLICANT_DRIVER      := NL80211
WPA_SUPPLICANT_VERSION           := VER_0_8_X
BOARD_HOSTAPD_DRIVER             := NL80211
PRODUCT_WIRELESS_TOOLS           := true

# Vold
BOARD_VOLD_MAX_PARTITIONS := 32
BOARD_VOLD_EMMC_SHARES_DEV_MAJOR := true

# Graphics
USE_OPENGL_RENDERER := true
BOARD_EGL_CFG := device/amazon/bowser/prebuilt/etc/egl.cfg

# OMAP
OMAP_ENHANCEMENT := true
OMAP_ENHANCEMENT_MULTIGPU := true
ENHANCED_DOMX := true

# Recovery
TARGET_RECOVERY_INITRC := device/amazon/bowser/recovery/init.rc
TARGET_RECOVERY_PRE_COMMAND := "echo 0 > /sys/block/mmcblk0boot0/force_ro; echo -n 3 | dd of=/dev/block/mmcblk0boot0 bs=1 count=1 seek=4104 ; sync"
BOARD_HAS_NO_SELECT_BUTTON := true
BOARD_HAS_LARGE_FILESYSTEM := true

# adb has root
ADDITIONAL_DEFAULT_PROPERTIES += ro.secure=0
ADDITIONAL_DEFAULT_PROPERTIES += ro.allow.mock.location=1

# boot.img creation
BOARD_CUSTOM_BOOTIMG_MK := device/amazon/bowser/boot.mk
TARGET_NO_BOOTLOADER := true
#TARGET_PROVIDES_RELEASETOOLS := true

# hack the ota
TARGET_RELEASETOOL_OTA_FROM_TARGET_SCRIPT := ./device/amazon/bowser/releasetools/bowser_ota_from_target_files
# not tested at all
TARGET_RELEASETOOL_IMG_FROM_TARGET_SCRIPT := ./device/amazon/bowser/releasetools/bowser_img_from_target_files

TARGET_KERNEL_CONFIG := cyanogenmod_bowser_defconfig
TARGET_KERNEL_SOURCE := kernel/bn/bowser

SGX_MODULES:
	cp kernel/bn/bowser/drivers/video/omap2/omapfb/omapfb.h $(KERNEL_OUT)/drivers/video/omap2/omapfb/omapfb.h
	make ARCH="arm" -C kernel/bn/bowser/external/sgx/src/eurasia_km/eurasiacon/build/linux2/omap4430_android CROSS_COMPILE=arm-eabi- TARGET_PRODUCT="blaze_tablet" BUILD=release TARGET_SGX=540 PLATFORM_VERSION=4.0  KERNEL_CROSS_COMPILE=arm-eabi- KERNELDIR=$(KERNEL_OUT)
	mv $(KERNEL_OUT)/../../target/kbuild/pvrsrvkm_sgx540_120.ko $(KERNEL_MODULES_OUT)

TARGET_KERNEL_MODULES := SGX_MODULES

TARGET_PROVIDES_LIBAUDIO := true
COMMON_GLOBAL_CFLAGS += -DICS_AUDIO_BLOB

# Keep this as a fallback
TARGET_PREBUILT_KERNEL := device/amazon/bowser/kernel
TARGET_SPECIFIC_HEADER_PATH := device/amazon/bowser/src-headers

ifdef ENHANCED_DOMX
    COMMON_GLOBAL_CFLAGS += -DENHANCED_DOMX
    DOMX_PATH := hardware/ti/domx
else
    DOMX_PATH := hardware/ti/omap4xxx/domx
endif

ifdef OMAP_ENHANCEMENT
    COMMON_GLOBAL_CFLAGS += -DOMAP_ENHANCEMENT -DTARGET_OMAP4
endif

ifdef OMAP_ENHANCEMENT_BURST_CAPTURE
    COMMON_GLOBAL_CFLAGS += -DOMAP_ENHANCEMENT_BURST_CAPTURE
endif

ifdef OMAP_ENHANCEMENT_S3D
    COMMON_GLOBAL_CFLAGS += -DOMAP_ENHANCEMENT_S3D
endif

ifdef OMAP_ENHANCEMENT_CPCAM
    COMMON_GLOBAL_CFLAGS += -DOMAP_ENHANCEMENT_CPCAM
    PRODUCT_MAKEFILES += $(LOCAL_DIR)/sdk_addon/ti_omap_addon.mk
endif

ifdef OMAP_ENHANCEMENT_VTC
    COMMON_GLOBAL_CFLAGS += -DOMAP_ENHANCEMENT_VTC
endif

ifdef USE_ITTIAM_AAC
    COMMON_GLOBAL_CFLAGS += -DUSE_ITTIAM_AAC
endif

ifdef OMAP_ENHANCEMENT_MULTIGPU
    COMMON_GLOBAL_CFLAGS += -DOMAP_ENHANCEMENT_MULTIGPU
endif

#Config for building TWRP
DEVICE_RESOLUTION := 1920x1200
RECOVERY_TOUCHSCREEN_SWAP_XY := true
RECOVERY_TOUCHSCREEN_FLIP_Y := true
TW_NO_REBOOT_BOOTLOADER := true
TW_NO_REBOOT_RECOVERY := true
TW_INTERNAL_STORAGE_PATH := "/emmc"
TW_INTERNAL_STORAGE_MOUNT_POINT := "emmc"
TW_EXTERNAL_STORAGE_PATH := "/sdcard"
TW_EXTERNAL_STORAGE_MOUNT_POINT := "sdcard"
TW_DEFAULT_EXTERNAL_STORAGE := true

# Bootanimation
TARGET_BOOTANIMATION_PRELOAD := true
