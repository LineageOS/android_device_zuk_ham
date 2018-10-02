#
# Copyright (C) 2015-2016 The CyanogenMod Project
#           (C) 2017-2018 The LineageOS Project
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

# Overlays
DEVICE_PACKAGE_OVERLAYS += \
    $(LOCAL_PATH)/overlay \
    $(LOCAL_PATH)/overlay-lineage \
    vendor/extra/overlays/phone-1080p

# Audio
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/audio/acdb/MTP_Bluetooth_cal.acdb:$(TARGET_COPY_OUT_SYSTEM)/etc/acdbdata/MTP/MTP_Bluetooth_cal.acdb \
    $(LOCAL_PATH)/audio/acdb/MTP_General_cal.acdb:$(TARGET_COPY_OUT_SYSTEM)/etc/acdbdata/MTP/MTP_General_cal.acdb \
    $(LOCAL_PATH)/audio/acdb/MTP_Global_cal.acdb:$(TARGET_COPY_OUT_SYSTEM)/etc/acdbdata/MTP/MTP_Global_cal.acdb \
    $(LOCAL_PATH)/audio/acdb/MTP_Handset_cal.acdb:$(TARGET_COPY_OUT_SYSTEM)/etc/acdbdata/MTP/MTP_Handset_cal.acdb \
    $(LOCAL_PATH)/audio/acdb/MTP_Hdmi_cal.acdb:$(TARGET_COPY_OUT_SYSTEM)/etc/acdbdata/MTP/MTP_Hdmi_cal.acdb \
    $(LOCAL_PATH)/audio/acdb/MTP_Headset_cal.acdb:$(TARGET_COPY_OUT_SYSTEM)/etc/acdbdata/MTP/MTP_Headset_cal.acdb \
    $(LOCAL_PATH)/audio/acdb/MTP_Speaker_cal.acdb:$(TARGET_COPY_OUT_SYSTEM)/etc/acdbdata/MTP/MTP_Speaker_cal.acdb

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/audio/audio_effects.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_effects.xml \
    $(LOCAL_PATH)/audio/audio_platform_info.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_platform_info.xml \
    $(LOCAL_PATH)/audio/audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_configuration.xml \
    $(LOCAL_PATH)/audio/mixer_paths.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths.xml \

PRODUCT_PACKAGES += \
    android.hardware.audio@2.0-impl \
    android.hardware.audio.effect@2.0-impl \
    audio.a2dp.default \
    audio_amplifier.msm8974 \
    audio_policy.msm8974 \
    audio.primary.msm8974 \
    audio.r_submix.default \
    audio.usb.default \
    libqcompostprocbundle \
    libqcomvisualizer \
    libqcomvoiceprocessing \
    libtfa98xx \
    tinymix

PRODUCT_PROPERTY_OVERRIDES += \
     ro.config.vc_call_vol_steps=6 \
     audio_hal.period_size=192 \
     audio.deep_buffer.media=true \
     audio.offload.video=true

# Bluetooth
PRODUCT_PACKAGES += \
    android.hardware.bluetooth@1.0-impl \
    libbt-vendor

# Boot animation
TARGET_SCREEN_HEIGHT := 1920
TARGET_SCREEN_WIDTH := 1080

# Camera
PRODUCT_PACKAGES += \
    android.hardware.camera.provider@2.4-impl \
    camera.device@1.0-impl \
    camera.msm8974

# Charger
PRODUCT_PACKAGES += \
    charger_res_images

# ConfigPanel
PRODUCT_PACKAGES += \
    ConfigPanel

# Dalvik/HWUI
$(call inherit-product-if-exists, frameworks/native/build/phone-xxhdpi-2048-dalvik-heap.mk)

# Display
PRODUCT_AAPT_PREF_CONFIG := xxhdpi

# DRM
PRODUCT_PACKAGES += \
    android.hardware.drm@1.0-impl

# Fingerprint sensor
PRODUCT_PACKAGES += \
    android.hardware.biometrics.fingerprint@2.0-service.ham

# GPS
PRODUCT_PACKAGES += \
    android.hardware.gnss@1.0-impl \
    gps.msm8974

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/gps/gps.conf:system/etc/gps.conf \
    $(LOCAL_PATH)/gps/izat.conf:system/etc/izat.conf \
    $(LOCAL_PATH)/gps/sap.conf:system/etc/sap.conf
#    $(LOCAL_PATH)/gps/flp.conf:system/etc/flp.conf

# Keylayouts
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/keylayout/fpc1020tp.kl:$(TARGET_COPY_OUT_VENDOR)/usr/keylayout/fpc1020tp.kl \
    $(LOCAL_PATH)/keylayout/Goodix-CTP.kl:$(TARGET_COPY_OUT_VENDOR)/usr/keylayout/Goodix-CTP.kl \
    $(LOCAL_PATH)/keylayout/gpio-keys.kl:$(TARGET_COPY_OUT_VENDOR)/usr/keylayout/gpio-keys.kl \
    $(LOCAL_PATH)/keylayout/msm8974-taiko-mtp-snd-card_Button_Jack.kl:$(TARGET_COPY_OUT_VENDOR)/usr/keylayout/msm8974-taiko-mtp-snd-card_Button_Jack.kl \
    $(LOCAL_PATH)/keylayout/qpnp_pon.kl:$(TARGET_COPY_OUT_VENDOR)/usr/keylayout/qpnp_pon.kl

# Keymaster
PRODUCT_PACKAGES += \
    android.hardware.keymaster@3.0-impl

# Lights
PRODUCT_PACKAGES += \
    android.hardware.light@2.0-service.ham

# Media profile
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/media_profiles_V1_0.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_profiles_V1_0.xml

# Media
PRODUCT_PROPERTY_OVERRIDES += \
    persist.media.treble_omx=false

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.fingerprint.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.fingerprint.xml

# Power
PRODUCT_PACKAGES += \
    android.hardware.power@1.0-service-qti

# Quick Charge 2.0
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    persist.usb.hvdcp.detect=true

# Ramdisk
PRODUCT_PACKAGES += \
    ueventd.qcom.rc \
    fstab.qcom \
    init.qcom.rc \
    init.qcom.usb.rc \
    init.recovery.qcom.rc

# Recovery
PRODUCT_PACKAGES += \
    librecovery_updater_ham

# System properties
PRODUCT_PROPERTY_OVERRIDES += \
    persist.timed.enable=true \
    ro.qualcomm.bt.hci_transport=smd \
    ro.telephony.default_network=9 \
    telephony.lteOnCdmaDevice=1 \
    ro.qualcomm.perf.cores_online=2

# Telephony
PRODUCT_PACKAGES += \
    qti-telephony-common \
    telephony-ext

PRODUCT_BOOT_JARS += \
    telephony-ext

# TextClassifier smart selection model files
PRODUCT_PACKAGES += \
    textclassifier.smartselection.bundle1

# USB
PRODUCT_PACKAGES += \
    com.android.future.usb.accessory

# Vibrator
PRODUCT_PACKAGES += \
    android.hardware.vibrator@1.0-impl

# WiFi
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/wifi/WCNSS_cfg.dat:$(TARGET_COPY_OUT_VENDOR)/firmware/wlan/prima/WCNSS_cfg.dat \
    $(LOCAL_PATH)/wifi/WCNSS_qcom_cfg.ini:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/WCNSS_qcom_cfg.ini \
    $(LOCAL_PATH)/wifi/WCNSS_qcom_wlan_nv.bin:$(TARGET_COPY_OUT_VENDOR)/firmware/wlan/prima/WCNSS_qcom_wlan_nv.bin

PRODUCT_PACKAGES += \
    wpa_supplicant_overlay.conf \
    p2p_supplicant_overlay.conf

# Call the proprietary setup
$(call inherit-product-if-exists, vendor/zuk/ham/ham-vendor.mk)

# Inherit from msm8974-common
$(call inherit-product, device/lenovo/msm8974-common/msm8974.mk)
