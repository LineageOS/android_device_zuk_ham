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

# inherit from Lenovo msm8974-common
-include device/lenovo/msm8974-common/BoardConfigCommon.mk

DEVICE_PATH := device/zuk/ham

BOARD_VENDOR := zuk

# Assert compatibility
TARGET_BOARD_INFO_FILE ?= $(DEVICE_PATH)/board-info.txt

# Include path
TARGET_SPECIFIC_HEADER_PATH += $(DEVICE_PATH)/include

# Kernel
BOARD_KERNEL_CMDLINE := console=tty60,115200,n8 androidboot.hardware=qcom \
                        user_debug=31 msm_rtb.filter=0x3b7 androidboot.bootdevice=msm_sdcc.1 \
			ehci-hcd.park=3 \
			vmalloc=480M
BOARD_MKBOOTIMG_ARGS := --ramdisk_offset 0x01000000 --tags_offset 0x00000100
TARGET_KERNEL_CONFIG := lineageos_k9_defconfig

# Enable DIAG on eng builds
ifeq ($(TARGET_BUILD_VARIANT),eng)
TARGET_KERNEL_ADDITIONAL_CONFIG:= lineageos_debug_config
endif

# Bluetooth
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(DEVICE_PATH)/bluetooth

# Camera
TARGET_USE_COMPAT_GRALLOC_ALIGN := true
TARGET_NEEDS_LEGACY_CAMERA_HAL1_DYN_NATIVE_HANDLE := true


# Lineage Hardware
BOARD_HARDWARE_CLASS := \
    hardware/lineage/lineagehw \
    $(DEVICE_PATH)/lineagehw

# Tap to wake
TARGET_TAP_TO_WAKE_NODE := /sys/devices/virtual/touch/tp_dev/gesture_on

# Filesystem
BOARD_BOOTIMAGE_PARTITION_SIZE          := 20971520
BOARD_CACHEIMAGE_PARTITION_SIZE         := 134217728
BOARD_OEMIMAGE_PARTITION_SIZE           := 133169152
BOARD_PERSISTIMAGE_PARTITION_SIZE       := 33554432
BOARD_RECOVERYIMAGE_PARTITION_SIZE      := 20971520
BOARD_SYSTEMIMAGE_PARTITION_SIZE        := 2147483648
BOARD_USERDATAIMAGE_PARTITION_SIZE      := 12815659008
BOARD_USERDATAEXTRAIMAGE_PARTITION_SIZE := 59718467072
BOARD_USERDATAEXTRAIMAGE_PARTITION_NAME := 64G

# Graphics
TARGET_NEEDS_PLATFORM_TEXT_RELOCATIONS := true

# HIDL
DEVICE_MANIFEST_FILE := $(DEVICE_PATH)/manifest.xml
DEVICE_MATRIX_FILE := $(DEVICE_PATH)/compatibility_matrix.xml

# Properties
TARGET_SYSTEM_PROP += device/zuk/ham/system.prop
# Recovery
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/rootdir/etc/fstab.qcom
# SELinux
BOARD_SEPOLICY_DIRS += \
    $(DEVICE_PATH)/sepolicy

# Releasetools
TARGET_RECOVERY_UPDATER_LIBS := librecovery_updater_ham
TARGET_RELEASETOOLS_EXTENSIONS := $(DEVICE_PATH)

-include vendor/zuk/ham/BoardConfigVendor.mk
