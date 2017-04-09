#
# Copyright (C) 2016 The CyanogenMod Project
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

# TODO: shouldn't be here
BOARD_VENDOR := zuk

DEVICE_PATH := device/zuk/ham

#Include path
TARGET_SPECIFIC_HEADER_PATH += $(DEVICE_PATH)/include

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := MSM8974
TARGET_NO_BOOTLOADER         := true
TARGET_NO_RADIOIMAGE         := true

# Platform
TARGET_BOARD_PLATFORM     := msm8974
TARGET_BOARD_PLATFORM_GPU := qcom-adreno330

# Architecture
TARGET_ARCH                := arm
TARGET_ARCH_VARIANT        := armv7-a-neon
TARGET_CPU_ABI             := armeabi-v7a
TARGET_CPU_ABI2            := armeabi
TARGET_CPU_VARIANT         := krait
TARGET_CPU_SMP             := true
ARCH_ARM_HAVE_TLS_REGISTER := true

# Kernel
BOARD_KERNEL_BASE                  := 0x00000000
BOARD_KERNEL_PAGESIZE              := 2048
BOARD_KERNEL_SEPARATED_DT          := true
BOARD_MKBOOTIMG_ARGS               := --ramdisk_offset 0x01000000 --tags_offset 0x00000100
BOARD_DTBTOOL_ARGS                 := -2
TARGET_KERNEL_ARCH                 := arm
BOARD_KERNEL_CMDLINE               := console=tty60,115200,n8 androidboot.hardware=qcom user_debug=31 msm_rtb.filter=0x3b7 ehci-hcd.park=3 androidboot.bootdevice=msm_sdcc.1 vmalloc=480M androidboot.selinux=permissive
TARGET_KERNEL_SOURCE               := kernel/cyanogen/msm8974
TARGET_KERNEL_CONFIG               := radioactive_defconfig

# Enable DIAG on debug builds
ifneq ($(TARGET_BUILD_VARIANT),user)
TARGET_KERNEL_ADDITIONAL_CONFIG:= cyanogenmod_debug_config
endif

# Audio
BOARD_USES_ALSA_AUDIO                      := true
AUDIO_FEATURE_ENABLED_MULTI_VOICE_SESSIONS := true
AUDIO_FEATURE_ENABLED_HWDEP_CAL            := true
AUDIO_FEATURE_ENABLED_LOW_LATENCY_CAPTURE  := true
AUDIO_FEATURE_LOW_LATENCY_PRIMARY          := true

# ANT+
BOARD_ANT_WIRELESS_DEVICE := "vfs-prerelease"

# Bluetooth
BOARD_HAVE_BLUETOOTH                        := true
BOARD_HAVE_BLUETOOTH_QCOM                   := true
QCOM_BT_USE_SMD_TTY                         := true
BLUETOOTH_HCI_USE_MCT                       := true
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(DEVICE_PATH)/bluetooth

# Boot animation
TARGET_BOOTANIMATION_MULTITHREAD_DECODE := true

# Camera
TARGET_USE_VENDOR_CAMERA_EXT    := true
USE_DEVICE_SPECIFIC_CAMERA      := true
TARGET_USE_COMPAT_GRALLOC_ALIGN := true
TARGET_HAS_LEGACY_CAMERA_HAL1   := true

# Charger
BOARD_CHARGER_DISABLE_INIT_BLANK := true

# CM Hardware
BOARD_HARDWARE_CLASS += $(DEVICE_PATH)/cmhw

# DT2W
TARGET_TAP_TO_WAKE_NODE := "/sys/devices/virtual/touch/tp_dev/gesture_on"

# ENCRYPTION
TARGET_HW_DISK_ENCRYPTION := true

# Enable dexpreopt to speed boot time
ifeq ($(HOST_OS),linux)
  ifeq ($(call match-word-in-list,$(TARGET_BUILD_VARIANT),user),true)
    ifeq ($(WITH_DEXPREOPT_BOOT_IMG_ONLY),)
      WITH_DEXPREOPT_BOOT_IMG_ONLY := true
    endif
  endif
endif

# Filesystem
BOARD_BOOTIMAGE_PARTITION_SIZE          := 20971520
BOARD_CACHEIMAGE_PARTITION_SIZE         := 134217728
BOARD_PERSISTIMAGE_PARTITION_SIZE       := 33554432
BOARD_RECOVERYIMAGE_PARTITION_SIZE      := 20971520
BOARD_SYSTEMIMAGE_PARTITION_SIZE        := 2147483648
BOARD_USERDATAIMAGE_PARTITION_SIZE      := 12815659008
BOARD_USERDATAEXTRAIMAGE_PARTITION_SIZE := 59718467072
BOARD_OEMIMAGE_PARTITION_SIZE           := 133169152
BOARD_FLASH_BLOCK_SIZE                  := 131072
BOARD_USERDATAEXTRAIMAGE_PARTITION_NAME := 64G
TARGET_USERIMAGES_USE_EXT4              := true
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE       := ext4
BOARD_PERSISTIMAGE_FILE_SYSTEM_TYPE     := ext4
BOARD_OEMIMAGE_FILE_SYSTEM_TYPE         := ext4

# Graphics
MAX_EGL_CACHE_SIZE               := 2048*1024
MAX_EGL_CACHE_KEY_SIZE           := 12*1024
USE_OPENGL_RENDERER              := true
TARGET_CONTINUOUS_SPLASH_ENABLED := true
TARGET_USES_C2D_COMPOSITION      := true
TARGET_USES_ION                  := true
OVERRIDE_RS_DRIVER               := libRSDriver_adreno.so
HAVE_ADRENO_SOURCE               := false
NUM_FRAMEBUFFER_SURFACE_BUFFERS  := 3
SF_VSYNC_EVENT_PHASE_OFFSET_NS   := 5000000
VSYNC_EVENT_PHASE_OFFSET_NS      := 7500000

# GPS
BOARD_VENDOR_QCOM_LOC_PDK_FEATURE_SET := true
USE_DEVICE_SPECIFIC_GPS               := true
USE_DEVICE_SPECIFIC_LOC_API           := true

# Legacy Blobs
TARGET_NEEDS_PLATFORM_TEXT_RELOCATIONS := true

# Lights
TARGET_PROVIDES_LIBLIGHT := true

# QCOM/CM HARDWARE
BOARD_USES_QCOM_HARDWARE     := true
BOARD_USES_CYANOGEN_HARDWARE := true

# QCOM Power HAL
TARGET_POWERHAL_VARIANT := qcom

# Radio
TARGET_RIL_VARIANT := caf

# Recovery
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/rootdir/etc/fstab.qcom

# Releasetools
TARGET_RELEASETOOLS_EXTENSIONS := $(DEVICE_PATH)

# RPC 
TARGET_NO_RPC := true

# Sensors Compat
BOARD_GLOBAL_CFLAGS += -DCOMPAT_SENSORS_M

# Snapdragon LLVM
TARGET_USE_SDCLANG := true

# Wifi
BOARD_HAS_QCOM_WLAN              := true
BOARD_HAS_QCOM_WLAN_SDK          := true
BOARD_WLAN_DEVICE                := qcwcn
WPA_SUPPLICANT_VERSION           := VER_0_8_X
BOARD_WPA_SUPPLICANT_DRIVER      := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_qcwcn
BOARD_HOSTAPD_DRIVER             := NL80211
BOARD_HOSTAPD_PRIVATE_LIB        := lib_driver_cmd_qcwcn
WIFI_DRIVER_FW_PATH_STA          := "sta"
WIFI_DRIVER_FW_PATH_AP           := "ap"
TARGET_USES_WCNSS_CTRL           := true
TARGET_USES_QCOM_WCNSS_QMI       := true
TARGET_USES_WCNSS_MAC_ADDR_REV   := true

# Wifi - EAP-SIM
CONFIG_EAP_PROXY                 := qmi
CONFIG_EAP_PROXY_DUAL_SIM        := true

# Inherit from QC proprietary
ifneq ($(QCPATH),)
-include $(QCPATH)/common/msm8974/BoardConfigVendor.mk
endif

# SELinux policies
#include device/qcom/sepolicy/sepolicy.mk

# QCOM sepolicy
#BOARD_SEPOLICY_DIRS += \
#    $(DEVICE_PATH)/sepolicy

-include vendor/zuk/ham/BoardConfigVendor.mk
