#
# Copyright (C) 2011 The Android Open-Source Project
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

# This file includes all definitions that apply to ALL kindleHD devices, and
# are also specific to kindleHD devices
#
# Everything in this directory will become public

DEVICE_FOLDER := device/amazon/bowser

ifeq ($(TARGET_PREBUILT_KERNEL),)
LOCAL_KERNEL := $(DEVICE_FOLDER)/kernel
else
LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

# copy all kernel modules under the "modules" directory to system/lib/modules
PRODUCT_COPY_FILES += $(shell \
    find $(DEVICE_FOLDER)/modules -name '*.ko' \
    | sed -r 's/^\/?(.*\/)([^/ ]+)$$/\1\2:system\/lib\/modules\/\2/' \
    | tr '\n' ' ')

PRODUCT_COPY_FILES += \
	$(LOCAL_KERNEL):kernel \
	$(DEVICE_FOLDER)/root/init.bowser.rc:root/init.bowser.rc \
	$(DEVICE_FOLDER)/root/init.bowser.usb.rc:root/init.bowser.usb.rc \
	$(DEVICE_FOLDER)/root/ueventd.bowser.rc:root/ueventd.bowser.rc \

# Audio
PRODUCT_COPY_FILES += \
	$(DEVICE_FOLDER)/prebuilt/etc/audio_policy.conf:/system/etc/audio_policy.conf \
	$(DEVICE_FOLDER)/prebuilt/etc/media_codecs.xml:/system/etc/media_codecs.xml

# Graphics
PRODUCT_COPY_FILES += \
    $(DEVICE_FOLDER)/prebuilt/sgx/gralloc.omap4470.so:/system/vendor/lib/hw/gralloc.omap4.so \
    $(DEVICE_FOLDER)/prebuilt/sgx/libEGL_POWERVR_SGX544_112.so:/system/vendor/lib/egl/libEGL_POWERVR_SGX544_112.so \
    $(DEVICE_FOLDER)/prebuilt/sgx/libGLESv1_CM_POWERVR_SGX544_112.so:/system/vendor/lib/egl/libGLESv1_CM_POWERVR_SGX544_112.so \
    $(DEVICE_FOLDER)/prebuilt/sgx/libGLESv2_POWERVR_SGX544_112.so:/system/vendor/lib/egl/libGLESv2_POWERVR_SGX544_112.so \
    $(DEVICE_FOLDER)/prebuilt/sgx/libglslcompiler_SGX544_112.so:/system/vendor/lib/libglslcompiler_SGX544_112.so \
    $(DEVICE_FOLDER)/prebuilt/sgx/libIMGegl_SGX544_112.so:/system/vendor/lib/libIMGegl_SGX544_112.so \
    $(DEVICE_FOLDER)/prebuilt/sgx/libpvr2d_SGX544_112.so:/system/vendor/lib/libpvr2d_SGX544_112.so \
    $(DEVICE_FOLDER)/prebuilt/sgx/libpvrANDROID_WSEGL_SGX544_112.so:/system/vendor/lib/libpvrANDROID_WSEGL_SGX544_112.so \
    $(DEVICE_FOLDER)/prebuilt/sgx/libPVRScopeServices_SGX544_112.so:/system/vendor/lib/libPVRScopeServices_SGX544_112.so \
    $(DEVICE_FOLDER)/prebuilt/sgx/libsrv_init_SGX544_112.so:/system/vendor/lib/libsrv_init_SGX544_112.so \
    $(DEVICE_FOLDER)/prebuilt/sgx/libsrv_um_SGX544_112.so:/system/vendor/lib/libsrv_um_SGX544_112.so \
    $(DEVICE_FOLDER)/prebuilt/sgx/libusc_SGX544_112.so:/system/vendor/lib/libusc_SGX544_112.so \
    $(DEVICE_FOLDER)/prebuilt/sgx/pvrsrvctl_SGX544_112:/system/vendor/bin/pvrsrvctl_SGX544_112 \
    $(DEVICE_FOLDER)/prebuilt/sgx/pvrsrvinit:/system/vendor/bin/pvrsrvinit \
    $(DEVICE_FOLDER)/prebuilt/sgx/powervr.ini:/system/etc/powervr.ini

# Prebuilts /system/bin
PRODUCT_COPY_FILES += \
    $(DEVICE_FOLDER)/prebuilt/bin/strace:/system/bin/strace

# Art
PRODUCT_COPY_FILES += \
    $(DEVICE_FOLDER)/prebuilt/poetry/poem.txt:root/sbin/poem.txt

# gfx. This needs http://git.omapzoom.org/?p=device/ti/proprietary-open.git;a=commit;h=47a8187f2d8a08f7210b3c964b3b8e50f3b0da66
#PRODUCT_PACKAGES += \
#	ti_omap4_sgx_libs \
#	ti_omap4_ducati_libs

# ducati
PRODUCT_COPY_FILES += \
	$(DEVICE_FOLDER)/firmware/ducati-m3.bin:/system/vendor/firmware/ducati-m3.bin

# Input
PRODUCT_COPY_FILES += \
	$(DEVICE_FOLDER)/prebuilt/usr/idc/cyttsp4-i2c.idc:system/usr/idc/cyttsp4-i2c.idc \
	$(DEVICE_FOLDER)/prebuilt/usr/keylayout/gpio-keys.kl:system/usr/keylayout/gpio-keys.kl\
	$(DEVICE_FOLDER)/prebuilt/usr/keylayout/twl6030_pwrbutton.kl:system/usr/keylayout/twl6030_pwrbutton.kl

# WIFI props
PRODUCT_COPY_FILES += \
	$(DEVICE_FOLDER)/firmware/wifi/firmware.bin:system/etc/wifi/firmware.bin \
	$(DEVICE_FOLDER)/firmware/wifi/nvram_jem_semco.txt:system/etc/wifi/nvram_jem_semco.txt \
	$(DEVICE_FOLDER)/firmware/wifi/nvram_jem_usi.txt:system/etc/wifi/nvram_jem_usi.txt \
	$(DEVICE_FOLDER)/firmware/wifi/nvram_jem-wan_semco.txt:system/etc/wifi/nvram_jem-wan_semco.txt \
	$(DEVICE_FOLDER)/firmware/wifi/nvram_jem-wan_usi.txt:system/etc/wifi/nvram_jem-wan_usi.txt \
	$(DEVICE_FOLDER)/firmware/wifi/nvram.txt:system/etc/wifi/nvram.txt \
	$(DEVICE_FOLDER)/prebuilt/etc/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf \


# Vold
PRODUCT_COPY_FILES += \
	$(DEVICE_FOLDER)/prebuilt/etc/vold.bowser.fstab:system/etc/vold.fstab

# Media Profile
PRODUCT_COPY_FILES += \
	$(DEVICE_FOLDER)/prebuilt/etc/media_profiles.xml:system/etc/media_profiles.xml

PRODUCT_PACKAGES += \
	hwprops \
	CMStats \
	lights.bowser

# Place permission files
PRODUCT_COPY_FILES += \
	frameworks/native/data/etc/tablet_core_hardware.xml:system/etc/permissions/tablet_core_hardware.xml \
	frameworks/native/data/etc/android.hardware.camera.autofocus.xml:system/etc/permissions/android.hardware.camera.autofocus.xml \
	frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
	frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
	frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
	frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
	frameworks/native/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml \
	frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
	frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
	frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
	frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
	frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
	packages/wallpapers/LivePicker/android.software.live_wallpaper.xml:system/etc/permissions/android.software.live_wallpaper.xml

# Device specific packages
PRODUCT_PACKAGES += \
	liblights.bowser \
	power.bowser \
	sensors.bowser

# Filesystem management tools
PRODUCT_PACKAGES += \
	make_ext4fs \
	sdcard \
	setup_fs

# postrecoveryboot for recovery
PRODUCT_COPY_FILES += \
    $(DEVICE_FOLDER)/recovery/postrecoveryboot.sh:recovery/root/sbin/postrecoveryboot.sh

# Wifi
PRODUCT_PACKAGES += \
	dhcpcd.conf \

# BT
PRODUCT_PACKAGES += \
	uim-sysfs \
	brcm_patchram_plus

PRODUCT_CHARACTERISTICS := tablet
PRODUCT_AAPT_CONFIG := normal mdpi
PRODUCT_AAPT_PREF_CONFIG := mdpi
# we have enough storage space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise

DEVICE_PACKAGE_OVERLAYS := $(DEVICE_FOLDER)/overlay/aosp

#$(call inherit-product, hardware/ti/omap4xxx/omap4.mk)
# dont use omap4.mk. We have to drop camera.omap4 for now.
# Just include rest directly here.
PRODUCT_VENDOR_KERNEL_HEADERS := hardware/ti/omap4xxx/kernel-headers
PRODUCT_PACKAGES += \
	libdomx \
	libOMX_Core \
	libOMX.TI.DUCATI1.VIDEO.H264E \
	libOMX.TI.DUCATI1.VIDEO.MPEG4E \
	libOMX.TI.DUCATI1.VIDEO.DECODER \
	libOMX.TI.DUCATI1.VIDEO.DECODER.secure \
	libOMX.TI.DUCATI1.VIDEO.CAMERA \
	libOMX.TI.DUCATI1.MISC.SAMPLE \
	libdrmdecrypt \
	libstagefrighthw \
        libI420colorconvert \
	libtiutils \
	libcamera \
	libion \
	libomxcameraadapter \
	smc_pa_ctrl \
	tf_daemon \
	libtf_crypto_sst \
	hwcomposer.omap4 \

PRODUCT_PACKAGES += \
	libjni_pinyinime \
	iontest \
	libedid \
	hwcomposer.default \
	smc_pa_ctrl \
	tf_daemon\
	libaudioutils \
	Music \
	tinyplay \
	tinymix \
	tinycap \
	sh \
	libwvm \
	audio_policy.default 

PRODUCT_PROPERTY_OVERRIDES := \
	ro.opengles.version=131072 \
	ro.sf.lcd_density=240 \
	wifi.interface=wlan0 \
	wifi.supplicant_scan_interval=45 \
	com.ti.omap_enhancement=true \
	omap.enhancement=true \
	ro.crypto.state=unencrypted \
	persist.sys.root_access=3 \
	ro.hwc.legacy_api=true

# Audio lib
PRODUCT_COPY_FILES += \
	$(DEVICE_FOLDER)/prebuilt/audio.primary.bowser.so:system/lib/hw/audio.primary.bowser.so

# camera lib
PRODUCT_COPY_FILES += \
	$(DEVICE_FOLDER)/prebuilt/camera/camera.omap4.so:system/lib/hw/camera.omap4.so \
	$(DEVICE_FOLDER)/prebuilt/camera/camera_dcc:system/vendor/bin/camera_dcc \
        $(DEVICE_FOLDER)/prebuilt/camera/R01_MVEN002_LD0_ND0_IR0_SH0_FL0_SVEN002_DCCID46/cid44_OV9726_alg_3a_ae_mms2_dcc.bin:system/vendor/camera/camera/R01_MVEN002_LD0_ND0_IR0_SH0_FL0_SVEN002_DCCID46/cid44_OV9726_alg_3a_ae_mms2_dcc.bin \
        $(DEVICE_FOLDER)/prebuilt/camera/R01_MVEN002_LD0_ND0_IR0_SH0_FL0_SVEN002_DCCID46/cid44_OV9726_alg_3a_af_affw_dcc.bin:system/vendor/camera/camera/R01_MVEN002_LD0_ND0_IR0_SH0_FL0_SVEN002_DCCID46/cid44_OV9726_alg_3a_af_affw_dcc.bin \
        $(DEVICE_FOLDER)/prebuilt/camera/R01_MVEN002_LD0_ND0_IR0_SH0_FL0_SVEN002_DCCID46/cid44_OV9726_alg_3a_af_affw_dcc_tuning.bin:system/vendor/camera/camera/R01_MVEN002_LD0_ND0_IR0_SH0_FL0_SVEN002_DCCID46/cid44_OV9726_alg_3a_af_affw_dcc_tuning.bin \
        $(DEVICE_FOLDER)/prebuilt/camera/R01_MVEN002_LD0_ND0_IR0_SH0_FL0_SVEN002_DCCID46/cid44_OV9726_alg_3a_af_caf_dcc.bin:system/vendor/camera/camera/R01_MVEN002_LD0_ND0_IR0_SH0_FL0_SVEN002_DCCID46/cid44_OV9726_alg_3a_af_caf_dcc.bin \
        $(DEVICE_FOLDER)/prebuilt/camera/R01_MVEN002_LD0_ND0_IR0_SH0_FL0_SVEN002_DCCID46/cid44_OV9726_alg_3a_af_caf_dcc_tuning.bin:system/vendor/camera/camera/R01_MVEN002_LD0_ND0_IR0_SH0_FL0_SVEN002_DCCID46/cid44_OV9726_alg_3a_af_caf_dcc_tuning.bin \
        $(DEVICE_FOLDER)/prebuilt/camera/R01_MVEN002_LD0_ND0_IR0_SH0_FL0_SVEN002_DCCID46/cid44_OV9726_alg_3a_af_hllc_dcc.bin:system/vendor/camera/camera/R01_MVEN002_LD0_ND0_IR0_SH0_FL0_SVEN002_DCCID46/cid44_OV9726_alg_3a_af_hllc_dcc.bin \
        $(DEVICE_FOLDER)/prebuilt/camera/R01_MVEN002_LD0_ND0_IR0_SH0_FL0_SVEN002_DCCID46/cid44_OV9726_alg_3a_af_hllc_dcc_tuning.bin:system/vendor/camera/camera/R01_MVEN002_LD0_ND0_IR0_SH0_FL0_SVEN002_DCCID46/cid44_OV9726_alg_3a_af_hllc_dcc_tuning.bin \
        $(DEVICE_FOLDER)/prebuilt/camera/R01_MVEN002_LD0_ND0_IR0_SH0_FL0_SVEN002_DCCID46/cid44_OV9726_alg_3a_af_saf_dcc.bin:system/vendor/camera/camera/R01_MVEN002_LD0_ND0_IR0_SH0_FL0_SVEN002_DCCID46/cid44_OV9726_alg_3a_af_saf_dcc.bin \
        $(DEVICE_FOLDER)/prebuilt/camera/R01_MVEN002_LD0_ND0_IR0_SH0_FL0_SVEN002_DCCID46/cid44_OV9726_alg_3a_af_saf_dcc_tuning.bin:system/vendor/camera/camera/R01_MVEN002_LD0_ND0_IR0_SH0_FL0_SVEN002_DCCID46/cid44_OV9726_alg_3a_af_saf_dcc_tuning.bin \
        $(DEVICE_FOLDER)/prebuilt/camera/R01_MVEN002_LD0_ND0_IR0_SH0_FL0_SVEN002_DCCID46/cid44_OV9726_alg_adjust_rgb2rgb_dcc.bin:system/vendor/camera/camera/R01_MVEN002_LD0_ND0_IR0_SH0_FL0_SVEN002_DCCID46/cid44_OV9726_alg_adjust_rgb2rgb_dcc.bin \
        $(DEVICE_FOLDER)/prebuilt/camera/R01_MVEN002_LD0_ND0_IR0_SH0_FL0_SVEN002_DCCID46/cid44_OV9726_awb_alg_ti3_gains_adjust.bin:system/vendor/camera/camera/R01_MVEN002_LD0_ND0_IR0_SH0_FL0_SVEN002_DCCID46/cid44_OV9726_awb_alg_ti3_gains_adjust.bin \
        $(DEVICE_FOLDER)/prebuilt/camera/R01_MVEN002_LD0_ND0_IR0_SH0_FL0_SVEN002_DCCID46/cid44_OV9726_awb_alg_ti3_tuning.bin:system/vendor/camera/camera/R01_MVEN002_LD0_ND0_IR0_SH0_FL0_SVEN002_DCCID46/cid44_OV9726_awb_alg_ti3_tuning.bin \
        $(DEVICE_FOLDER)/prebuilt/camera/R01_MVEN002_LD0_ND0_IR0_SH0_FL0_SVEN002_DCCID46/cid44_OV9726_capabilities.bin:system/vendor/camera/camera/R01_MVEN002_LD0_ND0_IR0_SH0_FL0_SVEN002_DCCID46/cid44_OV9726_capabilities.bin \
        $(DEVICE_FOLDER)/prebuilt/camera/R01_MVEN002_LD0_ND0_IR0_SH0_FL0_SVEN002_DCCID46/cid44_OV9726_current_module_calibration.bin:system/vendor/camera/camera/R01_MVEN002_LD0_ND0_IR0_SH0_FL0_SVEN002_DCCID46/cid44_OV9726_current_module_calibration.bin \
        $(DEVICE_FOLDER)/prebuilt/camera/R01_MVEN002_LD0_ND0_IR0_SH0_FL0_SVEN002_DCCID46/cid44_OV9726_ducati_eff_tun.bin:system/vendor/camera/camera/R01_MVEN002_LD0_ND0_IR0_SH0_FL0_SVEN002_DCCID46/cid44_OV9726_ducati_eff_tun.bin \
        $(DEVICE_FOLDER)/prebuilt/camera/R01_MVEN002_LD0_ND0_IR0_SH0_FL0_SVEN002_DCCID46/cid44_OV9726_ducati_gamma.bin:system/vendor/camera/camera/R01_MVEN002_LD0_ND0_IR0_SH0_FL0_SVEN002_DCCID46/cid44_OV9726_ducati_gamma.bin \
        $(DEVICE_FOLDER)/prebuilt/camera/R01_MVEN002_LD0_ND0_IR0_SH0_FL0_SVEN002_DCCID46/cid44_OV9726_ducati_lsc_2d.bin:system/vendor/camera/camera/R01_MVEN002_LD0_ND0_IR0_SH0_FL0_SVEN002_DCCID46/cid44_OV9726_ducati_lsc_2d.bin \
        $(DEVICE_FOLDER)/prebuilt/camera/R01_MVEN002_LD0_ND0_IR0_SH0_FL0_SVEN002_DCCID46/cid44_OV9726_ducati_nsf_ldc.bin:system/vendor/camera/camera/R01_MVEN002_LD0_ND0_IR0_SH0_FL0_SVEN002_DCCID46/cid44_OV9726_ducati_nsf_ldc.bin \
        $(DEVICE_FOLDER)/prebuilt/camera/R01_MVEN002_LD0_ND0_IR0_SH0_FL0_SVEN002_DCCID46/cid44_OV9726_face_detect_dcc.bin:system/vendor/camera/camera/R01_MVEN002_LD0_ND0_IR0_SH0_FL0_SVEN002_DCCID46/cid44_OV9726_face_detect_dcc.bin \
        $(DEVICE_FOLDER)/prebuilt/camera/R01_MVEN002_LD0_ND0_IR0_SH0_FL0_SVEN002_DCCID46/cid44_OV9726_face_tracking_dcc.bin:system/vendor/camera/camera/R01_MVEN002_LD0_ND0_IR0_SH0_FL0_SVEN002_DCCID46/cid44_OV9726_face_tracking_dcc.bin \
        $(DEVICE_FOLDER)/prebuilt/camera/R01_MVEN002_LD0_ND0_IR0_SH0_FL0_SVEN002_DCCID46/cid44_OV9726_gbce_sw1_dcc.bin:system/vendor/camera/camera/R01_MVEN002_LD0_ND0_IR0_SH0_FL0_SVEN002_DCCID46/cid44_OV9726_gbce_sw1_dcc.bin \
        $(DEVICE_FOLDER)/prebuilt/camera/R01_MVEN002_LD0_ND0_IR0_SH0_FL0_SVEN002_DCCID46/cid44_OV9726_golden_module_calibration.bin:system/vendor/camera/camera/R01_MVEN002_LD0_ND0_IR0_SH0_FL0_SVEN002_DCCID46/cid44_OV9726_golden_module_calibration.bin \
        $(DEVICE_FOLDER)/prebuilt/camera/R01_MVEN002_LD0_ND0_IR0_SH0_FL0_SVEN002_DCCID46/cid44_OV9726_h3a_aewb_dcc.bin:system/vendor/camera/camera/R01_MVEN002_LD0_ND0_IR0_SH0_FL0_SVEN002_DCCID46/cid44_OV9726_h3a_aewb_dcc.bin \
        $(DEVICE_FOLDER)/prebuilt/camera/R01_MVEN002_LD0_ND0_IR0_SH0_FL0_SVEN002_DCCID46/cid44_OV9726_ipipe_3d_lut_dcc.bin:system/vendor/camera/camera/R01_MVEN002_LD0_ND0_IR0_SH0_FL0_SVEN002_DCCID46/cid44_OV9726_ipipe_3d_lut_dcc.bin \
        $(DEVICE_FOLDER)/prebuilt/camera/R01_MVEN002_LD0_ND0_IR0_SH0_FL0_SVEN002_DCCID46/cid44_OV9726_ipipe_car_dcc.bin:system/vendor/camera/camera/R01_MVEN002_LD0_ND0_IR0_SH0_FL0_SVEN002_DCCID46/cid44_OV9726_ipipe_car_dcc.bin \
        $(DEVICE_FOLDER)/prebuilt/camera/R01_MVEN002_LD0_ND0_IR0_SH0_FL0_SVEN002_DCCID46/cid44_OV9726_ipipe_cfai_dcc.bin:system/vendor/camera/camera/R01_MVEN002_LD0_ND0_IR0_SH0_FL0_SVEN002_DCCID46/cid44_OV9726_ipipe_cfai_dcc.bin \
        $(DEVICE_FOLDER)/prebuilt/camera/R01_MVEN002_LD0_ND0_IR0_SH0_FL0_SVEN002_DCCID46/cid44_OV9726_ipipe_cgs_dcc.bin:system/vendor/camera/camera/R01_MVEN002_LD0_ND0_IR0_SH0_FL0_SVEN002_DCCID46/cid44_OV9726_ipipe_cgs_dcc.bin \
        $(DEVICE_FOLDER)/prebuilt/camera/R01_MVEN002_LD0_ND0_IR0_SH0_FL0_SVEN002_DCCID46/cid44_OV9726_ipipe_dpc_lut_dcc.bin:system/vendor/camera/camera/R01_MVEN002_LD0_ND0_IR0_SH0_FL0_SVEN002_DCCID46/cid44_OV9726_ipipe_dpc_lut_dcc.bin \
        $(DEVICE_FOLDER)/prebuilt/camera/R01_MVEN002_LD0_ND0_IR0_SH0_FL0_SVEN002_DCCID46/cid44_OV9726_ipipe_dpc_otf.bin:system/vendor/camera/camera/R01_MVEN002_LD0_ND0_IR0_SH0_FL0_SVEN002_DCCID46/cid44_OV9726_ipipe_dpc_otf.bin \
        $(DEVICE_FOLDER)/prebuilt/camera/R01_MVEN002_LD0_ND0_IR0_SH0_FL0_SVEN002_DCCID46/cid44_OV9726_ipipe_ee_dcc.bin:system/vendor/camera/camera/R01_MVEN002_LD0_ND0_IR0_SH0_FL0_SVEN002_DCCID46/cid44_OV9726_ipipe_ee_dcc.bin \
        $(DEVICE_FOLDER)/prebuilt/camera/R01_MVEN002_LD0_ND0_IR0_SH0_FL0_SVEN002_DCCID46/cid44_OV9726_ipipe_gic_dcc.bin:system/vendor/camera/camera/R01_MVEN002_LD0_ND0_IR0_SH0_FL0_SVEN002_DCCID46/cid44_OV9726_ipipe_gic_dcc.bin \
        $(DEVICE_FOLDER)/prebuilt/camera/R01_MVEN002_LD0_ND0_IR0_SH0_FL0_SVEN002_DCCID46/cid44_OV9726_ipipe_nf1_dcc.bin:system/vendor/camera/camera/R01_MVEN002_LD0_ND0_IR0_SH0_FL0_SVEN002_DCCID46/cid44_OV9726_ipipe_nf1_dcc.bin \
        $(DEVICE_FOLDER)/prebuilt/camera/R01_MVEN002_LD0_ND0_IR0_SH0_FL0_SVEN002_DCCID46/cid44_OV9726_ipipe_nf2_dcc.bin:system/vendor/camera/camera/R01_MVEN002_LD0_ND0_IR0_SH0_FL0_SVEN002_DCCID46/cid44_OV9726_ipipe_nf2_dcc.bin \
        $(DEVICE_FOLDER)/prebuilt/camera/R01_MVEN002_LD0_ND0_IR0_SH0_FL0_SVEN002_DCCID46/cid44_OV9726_ipipe_rgb2rgb_1_dcc.bin:system/vendor/camera/camera/R01_MVEN002_LD0_ND0_IR0_SH0_FL0_SVEN002_DCCID46/cid44_OV9726_ipipe_rgb2rgb_1_dcc.bin \
        $(DEVICE_FOLDER)/prebuilt/camera/R01_MVEN002_LD0_ND0_IR0_SH0_FL0_SVEN002_DCCID46/cid44_OV9726_ipipe_rgb2rgb_2_dcc.bin:system/vendor/camera/camera/R01_MVEN002_LD0_ND0_IR0_SH0_FL0_SVEN002_DCCID46/cid44_OV9726_ipipe_rgb2rgb_2_dcc.bin \
        $(DEVICE_FOLDER)/prebuilt/camera/R01_MVEN002_LD0_ND0_IR0_SH0_FL0_SVEN002_DCCID46/cid44_OV9726_ipipe_rgb2yuv_dcc.bin:system/vendor/camera/camera/R01_MVEN002_LD0_ND0_IR0_SH0_FL0_SVEN002_DCCID46/cid44_OV9726_ipipe_rgb2yuv_dcc.bin \
        $(DEVICE_FOLDER)/prebuilt/camera/R01_MVEN002_LD0_ND0_IR0_SH0_FL0_SVEN002_DCCID46/cid44_OV9726_ipipe_rsz_dcc.bin:system/vendor/camera/camera/R01_MVEN002_LD0_ND0_IR0_SH0_FL0_SVEN002_DCCID46/cid44_OV9726_ipipe_rsz_dcc.bin \
        $(DEVICE_FOLDER)/prebuilt/camera/R01_MVEN002_LD0_ND0_IR0_SH0_FL0_SVEN002_DCCID46/cid44_OV9726_ipipe_yuv444_to_yuv422_dcc.bin:system/vendor/camera/camera/R01_MVEN002_LD0_ND0_IR0_SH0_FL0_SVEN002_DCCID46/cid44_OV9726_ipipe_yuv444_to_yuv422_dcc.bin \
        $(DEVICE_FOLDER)/prebuilt/camera/R01_MVEN002_LD0_ND0_IR0_SH0_FL0_SVEN002_DCCID46/cid44_OV9726_isif_clamp_dcc.bin:system/vendor/camera/camera/R01_MVEN002_LD0_ND0_IR0_SH0_FL0_SVEN002_DCCID46/cid44_OV9726_isif_clamp_dcc.bin \
        $(DEVICE_FOLDER)/prebuilt/camera/R01_MVEN002_LD0_ND0_IR0_SH0_FL0_SVEN002_DCCID46/cid44_OV9726_isif_csc_dcc.bin:system/vendor/camera/camera/R01_MVEN002_LD0_ND0_IR0_SH0_FL0_SVEN002_DCCID46/cid44_OV9726_isif_csc_dcc.bin \
        $(DEVICE_FOLDER)/prebuilt/camera/R01_MVEN002_LD0_ND0_IR0_SH0_FL0_SVEN002_DCCID46/cid44_OV9726_iss_glbce3_dcc.bin:system/vendor/camera/camera/R01_MVEN002_LD0_ND0_IR0_SH0_FL0_SVEN002_DCCID46/cid44_OV9726_iss_glbce3_dcc.bin \
        $(DEVICE_FOLDER)/prebuilt/camera/R01_MVEN002_LD0_ND0_IR0_SH0_FL0_SVEN002_DCCID46/cid44_OV9726_iss_lbce_dcc.bin:system/vendor/camera/camera/R01_MVEN002_LD0_ND0_IR0_SH0_FL0_SVEN002_DCCID46/cid44_OV9726_iss_lbce_dcc.bin \
        $(DEVICE_FOLDER)/prebuilt/camera/R01_MVEN002_LD0_ND0_IR0_SH0_FL0_SVEN002_DCCID46/cid44_OV9726_iss_scene_modes_dcc.bin:system/vendor/camera/camera/R01_MVEN002_LD0_ND0_IR0_SH0_FL0_SVEN002_DCCID46/cid44_OV9726_iss_scene_modes_dcc.bin \
        $(DEVICE_FOLDER)/prebuilt/camera/R01_MVEN002_LD0_ND0_IR0_SH0_FL0_SVEN002_DCCID46/cid44_OV9726_iss_vstab_dcc.bin:system/vendor/camera/camera/R01_MVEN002_LD0_ND0_IR0_SH0_FL0_SVEN002_DCCID46/cid44_OV9726_iss_vstab_dcc.bin \
        $(DEVICE_FOLDER)/prebuilt/camera/R01_MVEN002_LD0_ND0_IR0_SH0_FL0_SVEN002_DCCID46/cid44_OV9726_ldc_cac_cfg_dcc.bin:system/vendor/camera/camera/R01_MVEN002_LD0_ND0_IR0_SH0_FL0_SVEN002_DCCID46/cid44_OV9726_ldc_cac_cfg_dcc.bin \
        $(DEVICE_FOLDER)/prebuilt/camera/R01_MVEN002_LD0_ND0_IR0_SH0_FL0_SVEN002_DCCID46/cid44_OV9726_ldc_cfg_dcc.bin:system/vendor/camera/camera/R01_MVEN002_LD0_ND0_IR0_SH0_FL0_SVEN002_DCCID46/cid44_OV9726_ldc_cfg_dcc.bin \
        $(DEVICE_FOLDER)/prebuilt/camera/R01_MVEN002_LD0_ND0_IR0_SH0_FL0_SVEN002_DCCID46/cid44_OV9726_lsc_interp.bin:system/vendor/camera/camera/R01_MVEN002_LD0_ND0_IR0_SH0_FL0_SVEN002_DCCID46/cid44_OV9726_lsc_interp.bin \
        $(DEVICE_FOLDER)/prebuilt/camera/R01_MVEN002_LD0_ND0_IR0_SH0_FL0_SVEN002_DCCID46/cid44_OV9726_vnf_cfg_dcc.bin:system/vendor/camera/camera/R01_MVEN002_LD0_ND0_IR0_SH0_FL0_SVEN002_DCCID46/cid44_OV9726_vnf_cfg_dcc.bin \
        $(DEVICE_FOLDER)/prebuilt/camera/R01_MVEN002_LD0_ND0_IR0_SH0_FL0_SVEN002_DCCID46/cid65535_kgen_dcc_preflash.bin:system/vendor/camera/camera/R01_MVEN002_LD0_ND0_IR0_SH0_FL0_SVEN002_DCCID46/cid65535_kgen_dcc_preflash.bin \

# enable Google-specific location features,
# like NetworkLocationProvider and LocationCollector
PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.locationfeatures=1 \
    ro.com.google.networklocation=1

# we have enough storage space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise


$(call inherit-product, frameworks/native/build/tablet-dalvik-heap.mk)

$(call inherit-product-if-exists, vendor/amazon/bowser/device-vendor.mk)
$(call inherit-product-if-exists, vendor/amazon/bowser/device-vendor-blobs.mk)

#$(call inherit-product, $(DEVICE_FOLDER)/wl12xx/ti-wl12xx-vendor.mk)
#$(call inherit-product, $(DEVICE_FOLDER)/wl12xx/ti-wpan-products.mk)
