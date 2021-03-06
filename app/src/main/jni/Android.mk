#APP_ABI := armeabi armeabi-v7a x86
ifeq ($(APP_ABI), x86)
LIB_NAME_PLUS := x86
else
LIB_NAME_PLUS := armeabi
endif

LOCAL_PATH:= $(call my-dir)

include $(CLEAR_VARS)
LOCAL_MODULE:= avcodec-prebuilt-$(LIB_NAME_PLUS)
LOCAL_SRC_FILES:= prebuilt/$(LIB_NAME_PLUS)/libavcodec-57.so
include $(PREBUILT_SHARED_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE:= avdevice-prebuilt-$(LIB_NAME_PLUS)
LOCAL_SRC_FILES:= prebuilt/$(LIB_NAME_PLUS)/libavdevice-57.so
include $(PREBUILT_SHARED_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE:= avfilter-prebuilt-$(LIB_NAME_PLUS)
LOCAL_SRC_FILES:= prebuilt/$(LIB_NAME_PLUS)/libavfilter-6.so
include $(PREBUILT_SHARED_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE:= avformat-prebuilt-$(LIB_NAME_PLUS)
LOCAL_SRC_FILES:= prebuilt/$(LIB_NAME_PLUS)/libavformat-57.so
include $(PREBUILT_SHARED_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE :=  avutil-prebuilt-$(LIB_NAME_PLUS)
LOCAL_SRC_FILES := prebuilt/$(LIB_NAME_PLUS)/libavutil-55.so
include $(PREBUILT_SHARED_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE := swresample-prebuilt-$(LIB_NAME_PLUS)
LOCAL_SRC_FILES := prebuilt/$(LIB_NAME_PLUS)/libswresample-2.so
include $(PREBUILT_SHARED_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE := swscale-prebuilt-$(LIB_NAME_PLUS)
LOCAL_SRC_FILES := prebuilt/$(LIB_NAME_PLUS)/libswscale-4.so
include $(PREBUILT_SHARED_LIBRARY)

include $(CLEAR_VARS)
ifeq ($(APP_ABI), x86)
TARGET_ARCH:=x86
TARGET_ARCH_ABI:=x86
else
LOCAL_ARM_MODE := arm
endif

LOCAL_MODULE := libffmpegjni
LOCAL_SRC_FILES := com_li_sheldon_ffmpeg4android_FFmpegNative.c
LOCAL_LDLIBS := -L$(SYSROOT)/usr/lib -llog -lz
LOCAL_SHARED_LIBRARIES:= avcodec-prebuilt-$(LIB_NAME_PLUS) \
                         avdevice-prebuilt-$(LIB_NAME_PLUS) \
                         avfilter-prebuilt-$(LIB_NAME_PLUS) \
                         avformat-prebuilt-$(LIB_NAME_PLUS) \
                         avutil-prebuilt-$(LIB_NAME_PLUS) \
                         swresample-prebuilt-$(LIB_NAME_PLUS) \
                         swscale-prebuilt-$(LIB_NAME_PLUS)
LOCAL_C_INCLUDES += -L$(SYSROOT)/usr/include
LOCAL_C_INCLUDES += $(LOCAL_PATH)/include

ifeq ($(APP_ABI), x86)
LOCAL_CFLAGS := -DUSE_X86_CONFIG
else
LOCAL_CFLAGS := -DUSE_ARM_CONFIG
endif
include $(BUILD_SHARED_LIBRARY)
