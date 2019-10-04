LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_C_INCLUDES += \
     $(call project-path-for,qcom-audio)/hal/msm8974/

LOCAL_HEADER_LIBRARIES := generated_kernel_headers
LOCAL_HEADER_LIBRARIES += libhardware_headers

LOCAL_SHARED_LIBRARIES := liblog libutils libcutils libdl
LOCAL_CFLAGS := -Wall -Werror -Wno-unused-parameter

LOCAL_SRC_FILES := audio_amplifier.c

LOCAL_MODULE := audio_amplifier.msm8974

LOCAL_MODULE_RELATIVE_PATH := hw

LOCAL_MODULE_TAGS := optional

LOCAL_VENDOR_MODULE := true

include $(BUILD_SHARED_LIBRARY)
