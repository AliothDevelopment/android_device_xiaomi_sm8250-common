#
# Copyright (C) 2018 The LineageOS Project
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

# Enable updating of APEXes
$(call inherit-product, $(SRC_TARGET_DIR)/product/updatable_apex.mk)

# Include GSI keys
$(call inherit-product, $(SRC_TARGET_DIR)/product/gsi_keys.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base_telephony.mk)


# Get non-open-source specific aspects
$(call inherit-product, vendor/xiaomi/sm8250-common/sm8250-common-vendor.mk)


PRODUCT_SHIPPING_API_LEVEL := 29
PRODUCT_TARGET_VNDK_VERSION := 30

# FIXME: master: compat for libprotobuf
# See https://android-review.googlesource.com/c/platform/prebuilts/vndk/v28/+/1109518
PRODUCT_PACKAGES += \
    libprotobuf-cpp-full-vendorcompat 
    

# ANT+
PRODUCT_PACKAGES += \
    AntHalService

# Audio
PRODUCT_PACKAGES += \
    audio.a2dp.default \
    libaacwrapper \
    libfmq 

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/audio/audio_policy_configuration.xml:$(TARGET_COPY_OUT_PRODUCT)/vendor_overlay/$(PRODUCT_TARGET_VNDK_VERSION)/etc/audio_policy_configuration.xml \
    $(LOCAL_PATH)/audio/audio_policy_configuration.xml:$(TARGET_COPY_OUT_PRODUCT)/vendor_overlay/$(PRODUCT_TARGET_VNDK_VERSION)/etc/audio/audio_policy_configuration.xml \
    $(LOCAL_PATH)/audio/audio_policy_engine_configuration.xml:$(TARGET_COPY_OUT_PRODUCT)/vendor_overlay/$(PRODUCT_TARGET_VNDK_VERSION)/etc/audio_policy_engine_configuration.xml

# Bluetooth
PRODUCT_PACKAGES += \
    BluetoothQti
     
# Camera
PRODUCT_PACKAGES += \
    OpenCamera

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/net.sourceforge.opencamera.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/net.sourceforge.opencamera.xml
    
# Context hub HAL
PRODUCT_PACKAGES += \
    android.hardware.contexthub@1.0-impl.generic \
    android.hardware.contexthub@1.0-service

# Common init scripts
PRODUCT_PACKAGES += \
    init.qcom.rc \
    init.recovery.qcom.rc 
    
# Device-specific settings
PRODUCT_PACKAGES += \
    XiaomiParts

PRODUCT_COPY_FILES += \
     $(LOCAL_PATH)/parts/privapp-permissions-parts.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/privapp-permissions-parts.xml

# Display
PRODUCT_PACKAGES += \
    libdisplayconfig \
    libqdMetaData \
    libqdMetaData.system \
    libvulkan \
    vendor.display.config@1.0
    
#EqualizerFX
PRODUCT_PACKAGES += \
    EqualizerFX

# fastbootd
PRODUCT_PACKAGES += \
    fastbootd

# Fingerprint
PRODUCT_COPY_FILES += \
    vendor/descendant/config/permissions/vendor.lineage.biometrics.fingerprint.inscreen.xml:system/etc/permissions/vendor.lineage.biometrics.fingerprint.inscreen.xml

PRODUCT_PACKAGES += \
    lineage.biometrics.fingerprint.inscreen@1.0-service.kona

    
# HIDL
PRODUCT_PACKAGES += \
    android.hidl.base@1.0 \
    android.hidl.manager@1.0 \
    libhidltransport \
    libhwbinder


    
# HotwordEnrollement app permissions
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/privapp-permissions-hotword.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/privapp-permissions-hotword.xml

# IFAA manager
PRODUCT_PACKAGES += \
    org.ifaa.android.manager

PRODUCT_BOOT_JARS += \
    org.ifaa.android.manager
    
#Light
#PRODUCT_PACKAGES += \
    android.hardware.light@2.0-impl.kona

# Media
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/media_profiles_vendor.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/media_profiles_vendor.xml
    
# Net
PRODUCT_PACKAGES += \
    netutils-wrapper-1.0
    
# NFC
PRODUCT_PACKAGES += \
    com.android.nfc_extras \
    com.gsma.services.nfc \
    NfcNci \
    SecureElement \
    Tag
    
# Overlays
DEVICE_PACKAGE_OVERLAYS += \
    $(LOCAL_PATH)/overlay \
    $(LOCAL_PATH)/overlay-lineage
    
# Overlays - override vendor ones
PRODUCT_PACKAGES += \
    AospFrameworkResOverlay \
    AospWifiResOverlay \
    DevicesAndroidOverlay \
    DevicesOverlay \
    FrameworksResTarget \
    GestureLineOverlay \
    MiuiBiometricResOverlay \
    MiuiFrameworkResOverlay \
    MiuiSettingsResOverlay \
    MiuiSystemUIResOverlay \
    WifiResTargety

# OTA
PRODUCT_HOST_PACKAGES += \
    signapk
    
# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.telephony.ims.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.hardware.telephony.ims.xml \
    frameworks/native/data/etc/handheld_core_hardware.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/handheld_core_hardware.xml \
    vendor/lineage/config/permissions/vendor.lineage.biometrics.fingerprint.inscreen.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/vendor.lineage.biometrics.fingerprint.inscreen.xml
    
# PowerStats
PRODUCT_PACKAGES += \
    android.hardware.power.stats@1.0-service.mock

# Ramdisk
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/etc/fstab.qcom:$(TARGET_COPY_OUT_RAMDISK)/fstab.qcom

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH) \
    hardware/xiaomi \
    vendor/nxp/opensource/sn100x \
    vendor/qcom/opensource/commonsys/packages/apps/Bluetooth \
    vendor/qcom/opensource/commonsys/system/bt/conf
    
# Telephony
PRODUCT_PACKAGES += \
    ims-ext-common \
    ims_ext_common.xml \
    qti-telephony-hidl-wrapper \
    qti_telephony_hidl_wrapper.xml \
    qti-telephony-utils \
    qti_telephony_utils.xml \
    telephony-ext

    
PRODUCT_PACKAGES += \
	android.hardware.radio@1.4


PRODUCT_BOOT_JARS += \
    telephony-ext

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/privapp-permissions-qti.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/privapp-permissions-qti.xml
    

# WiFi Display
PRODUCT_PACKAGES += \
    libnl

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/privapp-permissions-wfd.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/privapp-permissions-wfd.xml

PRODUCT_BUILD_SUPER_PARTITION := false
PRODUCT_USE_DYNAMIC_PARTITIONS := true
BOARD_BUILD_PRODUCT_IMAGE := true
    
# WiFi Tethering
PRODUCT_PACKAGES += \
    android.hardware.tetheroffload.config@1.0
