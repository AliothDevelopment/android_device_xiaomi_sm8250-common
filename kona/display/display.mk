#Display target definitions for kona

#Enable Charging Icon
TARGET_RECOVERY_PIXEL_FORMAT := RGBX_8888
TARGET_USES_GRALLOC1 := true
TARGET_USES_DRM_PP := true
TARGET_FORCE_HWC_FOR_VIRTUAL_DISPLAYS := true
MAX_VIRTUAL_DISPLAY_DIMENSION := 4096
NUM_FRAMEBUFFER_SURFACE_BUFFERS := 3
TARGET_USES_HWC2 := true
TARGET_USES_QCOM_DISPLAY_BSP := true
TARGET_USES_COLOR_METADATA := true
TARGET_HAS_WIDE_COLOR_DISPLAY := true
TARGET_HAS_HDR_DISPLAY := true
TARGET_USES_DISPLAY_RENDER_INTENTS := true
TARGET_USE_COLOR_MANAGEMENT := true
SF_WCG_COMPOSITION_DATA_SPACE := 143261696
TARGET_USES_QTI_MAPPER_2_0 := true
TARGET_USES_QTI_MAPPER_EXTENSIONS_1_1 := true
TARGET_USES_GRALLOC4 := true
TARGET_USES_ION := true
TARGET_USES_NEW_ION_API :=true
TARGET_ADDITIONAL_GRALLOC_10_USAGE_BITS := 0x546C00000000
TARGET_NO_RAW10_CUSTOM_FORMAT := true

# Display product definitions
PRODUCT_PACKAGES += \
    android.hardware.graphics.mapper@3.0-impl-qti-display \
    android.hardware.graphics.mapper@4.0-impl-qti-display \
    vendor.qti.hardware.display.allocator-service \
    vendor.qti.hardware.display.composer-service \
    android.hardware.memtrack@1.0-impl \
    android.hardware.memtrack@1.0-service \
    gralloc.kona \
    lights.kona \
    hwcomposer.kona \
    memtrack.kona \
    libsdmcore \
    libsdmutils \
    libqdMetaData \
    libdisplayconfig.qti \
    libdisplayconfig.vendor \
    vendor.qti.hardware.display.mapper@1.0.vendor \
    vendor.qti.hardware.display.mapper@1.1.vendor \
    vendor.qti.hardware.display.mapper@2.0.vendor \
    vendor.qti.hardware.display.mapper@3.0.vendor \
    vendor.qti.hardware.display.mapper@4.0.vendor \
    modetest \
    libtinyxml 
    
    
PRODUCT_PACKAGES += \
    vendor.display.config@1.0 \
    vendor.display.config@1.0.vendor \
    vendor.display.config@1.1.vendor \
    vendor.display.config@1.2.vendor \
    vendor.display.config@1.3.vendor \
    vendor.display.config@1.4.vendor \
    vendor.display.config@1.5.vendor \
    vendor.display.config@1.6.vendor \
    vendor.display.config@1.7.vendor \
    vendor.display.config@1.8.vendor \
    vendor.display.config@1.9.vendor \
    vendor.display.config@2.0 \
    vendor.display.config@2.0.vendor 


ifneq ($(TARGET_HAS_LOW_RAM),true)
#QDCM calibration xml file for 2k panel
PRODUCT_COPY_FILES += hardware/qcom-caf/sm8250/display/config/qdcm_calib_data_nt35597_cmd_mode_dsi_truly_panel_with_DSC.xml:$(TARGET_COPY_OUT_VENDOR)/etc/qdcm_calib_data_nt35597_cmd_mode_dsi_truly_panel_with_DSC.xml
PRODUCT_COPY_FILES += hardware/qcom-caf/sm8250/display/config/qdcm_calib_data_nt35597_cmd_mode_dsi_truly_panel_with_DSC.xml:$(TARGET_COPY_OUT_VENDOR)/etc/qdcm_calib_data_nt35597_video_mode_dsi_truly_panel_with_DSC.xml
#QDCM calibration xml file for 4k panel
PRODUCT_COPY_FILES += hardware/qcom-caf/sm8250/display/config/qdcm_calib_data_Sharp_4k_cmd_mode_dsc_dsi_panel.xml:$(TARGET_COPY_OUT_VENDOR)/etc/qdcm_calib_data_Sharp_4k_cmd_mode_dsc_dsi_panel.xml
PRODUCT_COPY_FILES += hardware/qcom-caf/sm8250/display/config/qdcm_calib_data_Sharp_4k_cmd_mode_dsc_dsi_panel.xml:$(TARGET_COPY_OUT_VENDOR)/etc/qdcm_calib_data_Sharp_4k_video_mode_dsc_dsi_panel.xml
#QDCM calibration xml file for amoled panel
PRODUCT_COPY_FILES += hardware/qcom-caf/sm8250/display/config/qdcm_calib_data_sw43404_amoled_cmd_mode_dsi_boe_panel_with_DSC.xml:$(TARGET_COPY_OUT_VENDOR)/etc/qdcm_calib_data_sw43404_amoled_cmd_mode_dsi_boe_panel_with_DSC.xml
PRODUCT_COPY_FILES += hardware/qcom-caf/sm8250/display/config/qdcm_calib_data_sw43404_amoled_cmd_mode_dsi_boe_panel_with_DSC.xml:$(TARGET_COPY_OUT_VENDOR)/etc/qdcm_calib_data_sw43404_amoled_video_mode_dsi_boe_panel_with_DSC.xml
PRODUCT_COPY_FILES += hardware/qcom-caf/sm8250/display/config/qdcm_calib_data_sw43404_amoled_cmd_mode_dsi_boe_panel_with_DSC.xml:$(TARGET_COPY_OUT_VENDOR)/etc/qdcm_calib_data_sw43404_amoled_boe_fhd+_panel_with_DSC.xml
#QDCM calibration xml file for dual panel
PRODUCT_COPY_FILES += hardware/qcom-caf/sm8250/display/config/qdcm_calib_data_default.xml:$(TARGET_COPY_OUT_VENDOR)/etc/qdcm_calib_data_sharp_1080p_cmd_mode_dsi_panel.xml
PRODUCT_COPY_FILES += hardware/qcom-caf/sm8250/display/config/qdcm_calib_data_default.xml:$(TARGET_COPY_OUT_VENDOR)/etc/qdcm_calib_data_nt35695b_truly_fhd_command_mode_dsi_panel.xml
#QDCM calibration xml file for Sharp fhd panel
PRODUCT_COPY_FILES += hardware/qcom-caf/sm8250/display/config/qdcm_calib_data_default.xml:$(TARGET_COPY_OUT_VENDOR)/etc/qdcm_calib_data_Sharp_fhd_cmd_mode_qsync_dsi_panel.xml
PRODUCT_COPY_FILES += hardware/qcom-caf/sm8250/display/config/qdcm_calib_data_default.xml:$(TARGET_COPY_OUT_VENDOR)/etc/qdcm_calib_data_Sharp_fhd_video_mode_qsync_dsi_panel.xml
#QDCM calibration xml file for Sharp 2k panel
PRODUCT_COPY_FILES += hardware/qcom-caf/sm8250/display/config/qdcm_calib_data_default.xml:$(TARGET_COPY_OUT_VENDOR)/etc/qdcm_calib_data_Sharp_2k_cmd_mode_qsync_dsi_panel.xml
PRODUCT_COPY_FILES += hardware/qcom-caf/sm8250/display/config/qdcm_calib_data_default.xml:$(TARGET_COPY_OUT_VENDOR)/etc/qdcm_calib_data_Sharp_2k_video_mode_qsync_dsi_panel.xml
#QDCM calibration xml file for r66451 amoled panel
PRODUCT_COPY_FILES += hardware/qcom-caf/sm8250/display/config/qdcm_calib_data_default.xml:$(TARGET_COPY_OUT_VENDOR)/etc/qdcm_calib_data_r66451_amoled_cmd_mode_dsi_visionox_panel_with_DSC.xml
PRODUCT_COPY_FILES += hardware/qcom-caf/sm8250/display/config/qdcm_calib_data_default.xml:$(TARGET_COPY_OUT_VENDOR)/etc/qdcm_calib_data_r66451_amoled_cmd_mode_dsi_visionox_60HZ_panel_with_DSC.xml
PRODUCT_COPY_FILES += hardware/qcom-caf/sm8250/display/config/qdcm_calib_data_default.xml:$(TARGET_COPY_OUT_VENDOR)/etc/qdcm_calib_data_r66451_amoled_cmd_mode_dsi_visionox_90HZ_panel_with_DSC.xml
PRODUCT_COPY_FILES += hardware/qcom-caf/sm8250/display/config/qdcm_calib_data_default.xml:$(TARGET_COPY_OUT_VENDOR)/etc/qdcm_calib_data_r66451_amoled_cmd_mode_dsi_visionox_120HZ_panel_with_DSC.xml
PRODUCT_COPY_FILES += hardware/qcom-caf/sm8250/display/config/qdcm_calib_data_default.xml:$(TARGET_COPY_OUT_VENDOR)/etc/qdcm_calib_data_r66451_amoled_video_mode_dsi_visionox_60HZ_panel_with_DSC.xml
PRODUCT_COPY_FILES += hardware/qcom-caf/sm8250/display/config/qdcm_calib_data_default.xml:$(TARGET_COPY_OUT_VENDOR)/etc/qdcm_calib_data_r66451_amoled_video_mode_dsi_visionox_90HZ_panel_with_DSC.xml
PRODUCT_COPY_FILES += hardware/qcom-caf/sm8250/display/config/qdcm_calib_data_default.xml:$(TARGET_COPY_OUT_VENDOR)/etc/qdcm_calib_data_r66451_amoled_video_mode_dsi_visionox_120HZ_panel_with_DSC.xml
#QDCM calibration xml file for rm69299 amoled fhd+ panel
PRODUCT_COPY_FILES += hardware/qcom-caf/sm8250/display/config/qdcm_calib_data_default.xml:$(TARGET_COPY_OUT_VENDOR)/etc/qdcm_calib_data_rm69299_amoled_fhd+_video_mode_dsi_visionox_panel.xml
PRODUCT_COPY_FILES += hardware/qcom-caf/sm8250/display/config/qdcm_calib_data_default.xml:$(TARGET_COPY_OUT_VENDOR)/etc/qdcm_calib_data_rm69299_amoled_fhd+_cmd_mode_dsi_visionox_panel.xml
#QDCM calibration xml file for nt36525 truly panel
PRODUCT_COPY_FILES += hardware/qcom-caf/sm8250/display/config/qdcm_calib_data_bengal_default.xml:$(TARGET_COPY_OUT_VENDOR)/etc/qdcm_calib_data_nt36525_video_mode_dsi_truly_panel.xml
endif
#QDCM calibration xml file for td4330 panel
PRODUCT_COPY_FILES += hardware/qcom-caf/sm8250/display/config/qdcm_calib_data_bengal_default.xml:$(TARGET_COPY_OUT_VENDOR)/etc/qdcm_calib_data_td4330_v2_cmd_mode_dsi_truly_panel.xml
PRODUCT_COPY_FILES += hardware/qcom-caf/sm8250/display/config/qdcm_calib_data_bengal_default.xml:$(TARGET_COPY_OUT_VENDOR)/etc/qdcm_calib_data_td4330_v2_video_mode_dsi_truly_panel.xml

PRODUCT_PROPERTY_OVERRIDES += \
    persist.demo.hdmirotationlock=false \
    persist.sys.sf.color_saturation=1.0 \
    persist.sys.sf.color_mode=0 \
    debug.sf.hw=0 \
    debug.egl.hw=0 \
    debug.sf.latch_unsignaled=1 \
    debug.sf.high_fps_late_app_phase_offset_ns=1000000 \
    debug.mdpcomp.logs=0 \
    vendor.gralloc.disable_ubwc=0 \
    vendor.display.disable_scaler=0 \
    vendor.display.disable_excl_rect=0 \
    vendor.display.disable_excl_rect_partial_fb=1 \
    vendor.display.enable_posted_start_dyn=1 \
    vendor.display.enable_optimize_refresh=1 \
    vendor.display.use_smooth_motion=0\
    vendor.display.comp_mask=2 \
    vendor.display.enable_async_powermode=1 \
    vendor.display.qdcm.mode_combine=1

PRODUCT_PROPERTY_OVERRIDES += \
    vendor.display.disable_offline_rotator=1

PRODUCT_PROPERTY_OVERRIDES += \
    debug.sf.enable_gl_backpressure=1 \
    debug.sf.enable_advanced_sf_phase_offset=1 \
    debug.sf.high_fps_late_sf_phase_offset_ns=-4000000 \
    debug.sf.high_fps_early_phase_offset_ns=-4000000 \
    debug.sf.high_fps_early_gl_phase_offset_ns=-4000000



ifneq ($(PLATFORM_VERSION), 10)
    PRODUCT_PROPERTY_OVERRIDES +=  vendor.display.enable_async_powermode=0
endif

#Set WCG properties
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += ro.surface_flinger.has_wide_color_display=true
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += ro.surface_flinger.has_HDR_display=true
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += ro.surface_flinger.use_color_management=true
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += ro.surface_flinger.max_virtual_display_dimension=4096
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += ro.surface_flinger.wcg_composition_dataspace=143261696
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += ro.surface_flinger.protected_contents=true
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += ro.surface_flinger.use_content_detection_for_refresh_rate=true
# setTouchTimerMs indicates what is considered a timeout in milliseconds for Scheduler.
# This value is used by the Scheduler to trigger touch inactivity callbacks that will switch the
# display to a lower refresh rate. Setting this property to 0 means there is no timer.
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += ro.surface_flinger.set_touch_timer_ms=200
# Some hardware can do RGB->YUV conversion more efficiently in hardware
# controlled by HWC than in hardware controlled by the video encoder.
# This instruct VirtualDisplaySurface to use HWC for such conversion on
# GL composition.
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += ro.surface_flinger.force_hwc_copy_for_virtual_displays=true
# Indicates whether background blurs are supported.
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += ro.surface_flinger.supports_background_blur


ifneq (,$(filter userdebug eng, $(TARGET_BUILD_VARIANT)))
# Recovery is enabled, logging is enabled
PRODUCT_PROPERTY_OVERRIDES += \
    vendor.display.disable_hw_recovery_dump=0
else
# Recovery is enabled, logging is disabled
PRODUCT_PROPERTY_OVERRIDES += \
    vendor.display.disable_hw_recovery_dump=1
endif

QMAA_ENABLED_HAL_MODULES += display
ifeq ($(TARGET_USES_QMAA),true)
ifeq ($(TARGET_USES_QMAA_OVERRIDE_DISPLAY),true)
PRODUCT_PROPERTY_OVERRIDES += \
    vendor.display.enable_null_display=0
else
TARGET_IS_HEADLESS := true
PRODUCT_PROPERTY_OVERRIDES += \
    vendor.display.enable_null_display=1
endif
endif

# Properties using default value:
#    vendor.display.disable_hw_recovery=0
