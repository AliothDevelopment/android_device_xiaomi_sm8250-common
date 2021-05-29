AUDIO_FEATURE_ENABLED_AHAL_EXT := false
AUDIO_FEATURE_ENABLED_DLKM := true
AUDIO_FEATURE_ENABLED_DS2_DOLBY_DAP := false
AUDIO_FEATURE_ENABLED_DTS_EAGLE := false
AUDIO_FEATURE_ENABLED_DYNAMIC_LOG := false
AUDIO_FEATURE_ENABLED_EXTENDED_COMPRESS_FORMAT := true
AUDIO_FEATURE_ENABLED_GEF_SUPPORT := true
AUDIO_FEATURE_ENABLED_HW_ACCELERATED_EFFECTS := false
BOARD_SUPPORTS_SOUND_TRIGGER := true
BOARD_USES_ALSA_AUDIO := true
USE_CUSTOM_AUDIO_POLICY := 1
USE_XML_AUDIO_POLICY_CONF := 1
AUDIO_FEATURE_ENABLED_PCM_OFFLOAD := true
AUDIO_FEATURE_ENABLED_PCM_OFFLOAD_24 := true
AUDIO_FEATURE_ENABLED_FLAC_OFFLOAD := true
AUDIO_FEATURE_ENABLED_VORBIS_OFFLOAD := true
AUDIO_FEATURE_ENABLED_WMA_OFFLOAD := true
AUDIO_FEATURE_ENABLED_ALAC_OFFLOAD := true
AUDIO_FEATURE_ENABLED_APE_OFFLOAD := true
AUDIO_FEATURE_ENABLED_AAC_ADTS_OFFLOAD := true
AUDIO_FEATURE_ENABLED_MPEGH_SW_DECODER := true
AUDIO_FEATURE_ENABLED_PROXY_DEVICE := true
AUDIO_FEATURE_ENABLED_AUDIOSPHERE := true
AUDIO_FEATURE_ENABLED_USB_TUNNEL := true
AUDIO_FEATURE_ENABLED_A2DP_OFFLOAD := true
AUDIO_FEATURE_ENABLED_INSTANCE_ID := true
AUDIO_USE_DEEP_AS_PRIMARY_OUTPUT := false
AUDIO_FEATURE_ENABLED_CUSTOMSTEREO := true
AUDIO_FEATURE_ENABLED_FLUENCE := true
AUDIO_FEATURE_ENABLED_HDMI_EDID := true
AUDIO_FEATURE_ENABLED_HDMI_PASSTHROUGH := true
#AUDIO_FEATURE_ENABLED_KEEP_ALIVE := true
AUDIO_FEATURE_ENABLED_DISPLAY_PORT := true
AUDIO_FEATURE_ENABLED_HFP := true
AUDIO_FEATURE_ENABLED_INCALL_MUSIC := true
AUDIO_FEATURE_ENABLED_KPI_OPTIMIZE := true
AUDIO_FEATURE_ENABLED_ACDB_LICENSE := false
AUDIO_FEATURE_ENABLED_DEV_ARBI := false
AUDIO_FEATURE_ENABLED_SND_MONITOR := true
AUDIO_FEATURE_ENABLED_USB_BURST_MODE := true
AUDIO_FEATURE_ENABLED_SVA_MULTI_STAGE := true
AUDIO_FEATURE_ENABLED_BATTERY_LISTENER := true
AUDIO_FEATURE_ENABLED_EXTN_FORMATS := true
#AUDIO_FEATURE_ENABLED_3D_AUDIO := true
##AUDIO_FEATURE_FLAGS
AUDIO_FEATURE_ENABLED_CONCURRENT_CAPTURE := true
AUDIO_FEATURE_ENABLED_COMPRESS_INPUT := true
AUDIO_FEATURE_ENABLED_COMPRESS_CAPTURE := false
AUDIO_FEATURE_ENABLED_COMPRESS_VOIP := false
AUDIO_FEATURE_ENABLED_DYNAMIC_ECNS := true
AUDIO_FEATURE_ENABLED_ANC_HEADSET := true
AUDIO_FEATURE_ENABLED_SOURCE_TRACKING := true
AUDIO_FEATURE_ENABLED_GEF_SUPPORT := true



# for HIDL related packages
PRODUCT_PACKAGES += \
    android.hardware.audio.service \
    audio.a2dp.default \
    audio.usb.default \
    audio.r_submix.default \
    audio.primary.kona \
    libqahwwrapper \
    libqahw \
    android.hardware.bluetooth.audio@2.0-impl \
    audio.bluetooth.default \
    liba2dpoffload \
    libaudiopreprocessing \
    libbatterylistener \
    libbundlewrapper \
    libcirrusspkrprot \
    libcomprcapture \
    libdownmix \
    libhfp \
    libdynproc \
    libeffectproxy \
    libexthwplugin \
    libhdmiedid \
    libhfp \
    librmnetctl \
    libldnhncr \
    libqcompostprocbundle \
    libqcomvisualizer \
    libqcomvoiceprocessing \
    libreverbwrapper \
    libsndmonitor \
    libspkrprot \
    audio.hearing_aid.default \
    libaudio-resampler \
    libvisualizer \
    libvolumelistener \
    libaudiozoom \
    tinymix \
    tinyplay \
    libtinycompress

PRODUCT_PACKAGES += \
	capture.sh \
	capture_headset.sh\
	playback.sh\
	playback_headset.sh\
	setup_backmic2headphone.sh\
	setup_backmic2headphone.sh\
	setup_headsetmic2headphone.sh\
	setup_mainmic2headphone.sh\
	setup_topmic2headphone.sh\
	teardown_loopback.sh
	
PRODUCT_COPY_FILES += $(call find-copy-subdir-files,*,device/xiaomi/sm8250-common/audio,$(TARGET_COPY_OUT_VENDOR)/etc)

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.audio.pro.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.audio.pro.xml \
    frameworks/native/data/etc/android.hardware.audio.low_latency.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.audio.low_latency.xml

PRODUCT_COPY_FILES += \
    $(TOPDIR)frameworks/av/services/audiopolicy/config/r_submix_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/r_submix_audio_policy_configuration.xml \
    $(TOPDIR)frameworks/av/services/audiopolicy/config/usb_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/usb_audio_policy_configuration.xml  \
    frameworks/av/services/audiopolicy/config/a2dp_in_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/a2dp_in_audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/bluetooth_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/bluetooth_audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/bluetooth_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/bluetooth_audio_policy_configuration.xml \
    
# Low latency audio buffer size in frames
PRODUCT_PROPERTY_OVERRIDES += \
    vendor.audio_hal.period_size=192

##Ambisonic Capture
PRODUCT_PROPERTY_OVERRIDES += \
persist.vendor.audio.ambisonic.capture=false \
persist.vendor.audio.ambisonic.auto.profile=false

PRODUCT_PROPERTY_OVERRIDES += \
persist.vendor.audio.apptype.multirec.enabled=false

##fluencetype can be "fluence" or "fluencepro" or "none"
PRODUCT_PROPERTY_OVERRIDES += \
ro.vendor.audio.sdk.fluencetype=fluence\
persist.vendor.audio.fluence.voicecall=true\
persist.vendor.audio.fluence.voicerec=false\
persist.vendor.audio.fluence.speaker=true\
persist.vendor.audio.fluence.tmic.enabled=false

##speaker protection v3 switch and ADSP AFE API version
PRODUCT_PROPERTY_OVERRIDES += \
persist.vendor.audio.spv3.enable=true\
persist.vendor.audio.avs.afe_api_version=2

#disable tunnel encoding
PRODUCT_PROPERTY_OVERRIDES += \
vendor.audio.tunnel.encode=false

#Disable RAS Feature by default
PRODUCT_PROPERTY_OVERRIDES += \
persist.vendor.audio.ras.enabled=false

PRODUCT_PROPERTY_OVERRIDES += \
persist.vendor.audio.ring.filter.mask=0

#Buffer size in kbytes for compress offload playback
PRODUCT_PROPERTY_OVERRIDES += \
vendor.audio.offload.buffer.size.kb=256

#Enable audio track offload by default
PRODUCT_PROPERTY_OVERRIDES += \
vendor.audio.offload.track.enable=true

#enable voice path for PCM VoIP by default
PRODUCT_PROPERTY_OVERRIDES += \
vendor.voice.path.for.pcm.voip=true

#Enable multi channel aac through offload
PRODUCT_PROPERTY_OVERRIDES += \
vendor.audio.offload.multiaac.enable=true

#Enable DS2, Hardbypass feature for Dolby
PRODUCT_PROPERTY_OVERRIDES += \
vendor.audio.dolby.ds2.enabled=false\
vendor.audio.dolby.ds2.hardbypass=false

#Disable Multiple offload sesison
PRODUCT_PROPERTY_OVERRIDES += \
vendor.audio.offload.multiple.enabled=false

#Disable Compress passthrough playback
PRODUCT_PROPERTY_OVERRIDES += \
vendor.audio.offload.passthrough=false

#Disable surround sound recording
PRODUCT_PROPERTY_OVERRIDES += \
ro.vendor.audio.sdk.ssr=false

#enable dsp gapless mode by default
PRODUCT_PROPERTY_OVERRIDES += \
vendor.audio.offload.gapless.enabled=true

#timeout crash duration set to 20sec before system is ready.
#timeout duration updates to default timeout of 5sec once the system is ready.
PRODUCT_PROPERTY_OVERRIDES += \
vendor.audio.hal.boot.timeout.ms=20000

#enable pbe effects
PRODUCT_PROPERTY_OVERRIDES += \
vendor.audio.safx.pbe.enabled=false

PRODUCT_PROPERTY_OVERRIDES += \
ro.vendor.audio.gain.support=true

PRODUCT_PROPERTY_OVERRIDES += \
ro.vendor.audio.game.effect=true

PRODUCT_PROPERTY_OVERRIDES += \
ro.vendor.audio.karaok.support=true

PRODUCT_PROPERTY_OVERRIDES += \
ro.vendor.audio.ns.support=false

PRODUCT_PROPERTY_OVERRIDES += \
ro.vendor.audio.ring.filter=true

PRODUCT_PROPERTY_OVERRIDES += \
ro.vendor.audio.sfx.audiovisual=false

PRODUCT_PROPERTY_OVERRIDES += \
ro.vendor.audio.sfx.earadj=true

PRODUCT_PROPERTY_OVERRIDES += \
ro.vendor.audio.sfx.scenario=true

PRODUCT_PROPERTY_OVERRIDES += \
ro.vendor.audio.sos=true

PRODUCT_PROPERTY_OVERRIDES += \
ro.vendor.audio.soundfx.usb=true



#parser input buffer size(256kb) in byte stream mode
PRODUCT_PROPERTY_OVERRIDES += \
vendor.audio.parser.ip.buffer.size=262144

#flac sw decoder 24 bit decode capability
PRODUCT_PROPERTY_OVERRIDES += \
vendor.audio.flac.sw.decoder.24bit=true

#split a2dp DSP supported encoder list
PRODUCT_PROPERTY_OVERRIDES += \
persist.vendor.bt.a2dp_offload_cap=sbc-aptx-aptxtws-aptxhd-aac-ldac

# A2DP offload support
PRODUCT_PROPERTY_OVERRIDES += \
ro.bluetooth.a2dp_offload.supported=true

# Disable A2DP offload
PRODUCT_PROPERTY_OVERRIDES += \
persist.bluetooth.a2dp_offload.disabled=false

# A2DP offload DSP supported encoder list
PRODUCT_PROPERTY_OVERRIDES += \
persist.bluetooth.a2dp_offload.cap=sbc-aac-aptx-aptxhd-ldac

#enable software decoders for ALAC and APE
PRODUCT_PROPERTY_OVERRIDES += \
vendor.audio.use.sw.alac.decoder=true
PRODUCT_PROPERTY_OVERRIDES += \
vendor.audio.use.sw.ape.decoder=true

#enable software decoder for MPEG-H
PRODUCT_PROPERTY_OVERRIDES += \
vendor.audio.use.sw.mpegh.decoder=true

#enable hw aac encoder by default
PRODUCT_PROPERTY_OVERRIDES += \
vendor.audio.hw.aac.encoder=true

#Set HAL buffer size to samples equal to 3 ms
PRODUCT_PROPERTY_OVERRIDES += \
vendor.audio_hal.in_period_size=144

#Set HAL buffer size to 3 ms
PRODUCT_PROPERTY_OVERRIDES += \
vendor.audio_hal.period_multiplier=2

#ADM Buffering size in ms
PRODUCT_PROPERTY_OVERRIDES += \
vendor.audio.adm.buffering.ms=2

#enable headset calibration
PRODUCT_PROPERTY_OVERRIDES += \
vendor.audio.volume.headset.gain.depcal=true

#enable dualmic fluence for voice communication
PRODUCT_PROPERTY_OVERRIDES += \
persist.vendor.audio.fluence.voicecomm=true


USE_XML_AUDIO_POLICY_CONF := 1

#enable keytone FR
PRODUCT_PROPERTY_OVERRIDES += \
vendor.audio.hal.output.suspend.supported=true

#Enable AAudio MMAP/NOIRQ data path
#2 is AAUDIO_POLICY_AUTO so it will try MMAP then fallback to Legacy path
PRODUCT_PROPERTY_OVERRIDES += aaudio.mmap_policy=2
PRODUCT_PROPERTY_OVERRIDES += af.fast_track_multiplier=1
#Allow EXCLUSIVE then fall back to SHARED.
PRODUCT_PROPERTY_OVERRIDES += aaudio.mmap_exclusive_policy=2
PRODUCT_PROPERTY_OVERRIDES += aaudio.hw_burst_min_usec=2000
PRODUCT_PROPERTY_OVERRIDES +=persist.audio.button_jack.profile
PRODUCT_PROPERTY_OVERRIDES +=persist.audio.button_jack.switch

#enable mirror-link feature
PRODUCT_PROPERTY_OVERRIDES += \
vendor.audio.enable.mirrorlink=false

#enable voicecall speaker stereo
PRODUCT_PROPERTY_OVERRIDES += \
persist.vendor.audio.voicecall.speaker.stereo=true

#enable AAC frame ctl for A2DP sinks
PRODUCT_PROPERTY_OVERRIDES += \
persist.vendor.bt.aac_frm_ctl.enabled=true

#enable VBR frame ctl
PRODUCT_PROPERTY_OVERRIDES += \
persist.vendor.bt.aac_vbr_frm_ctl.enabled=true

#add dynamic feature flags here
PRODUCT_PROPERTY_OVERRIDES += \
vendor.audio.feature.a2dp_offload.enable=true \
vendor.audio.feature.afe_proxy.enable=true \
vendor.audio.feature.anc_headset.enable=false \
vendor.audio.feature.battery_listener.enable=true \
vendor.audio.feature.compr_cap.enable=false \
vendor.audio.feature.compress_in.enable=true \
vendor.audio.feature.compress_meta_data.enable=true \
vendor.audio.feature.compr_voip.enable=true \
vendor.audio.feature.concurrent_capture.enable=true \
vendor.audio.feature.custom_stereo.enable=true \
vendor.audio.feature.display_port.enable=true \
vendor.audio.feature.dsm_feedback.enable=false \
vendor.audio.feature.dynamic_ecns.enable=true \
vendor.audio.feature.ext_hw_plugin.enable=false \
vendor.audio.feature.external_dsp.enable=false \
vendor.audio.feature.external_speaker.enable=false \
vendor.audio.feature.external_speaker_tfa.enable=false \
vendor.audio.feature.fluence.enable=true \
vendor.audio.feature.fm.enable=true \
vendor.audio.feature.hdmi_edid.enable=true \
vendor.audio.feature.hdmi_passthrough.enable=true \
vendor.audio.feature.hfp.enable=true \
vendor.audio.feature.hifi_audio.enable=false \
vendor.audio.feature.hwdep_cal.enable=false \
vendor.audio.feature.incall_music.enable=true \
vendor.audio.feature.multi_voice_session.enable=true \
vendor.audio.feature.keep_alive.enable=true \
vendor.audio.feature.kpi_optimize.enable=true \
vendor.audio.feature.maxx_audio.enable=false \
vendor.audio.feature.ras.enable=true \
vendor.audio.feature.record_play_concurency.enable=false \
vendor.audio.feature.src_trkn.enable=true \
vendor.audio.feature.spkr_prot.enable=false \
vendor.audio.feature.ssrec.enable=true \
vendor.audio.feature.usb_offload.enable=true \
vendor.audio.feature.usb_offload_burst_mode.enable=true \
vendor.audio.feature.usb_offload_sidetone_volume.enable=false \
vendor.audio.feature.deepbuffer_as_primary.enable=false \
vendor.audio.feature.vbat.enable=true \
vendor.audio.feature.wsa.enable=false \
vendor.audio.feature.audiozoom.enable=false \
vendor.audio.feature.snd_mon.enable=true \
persist.vendor.audio_hal.dsp_bit_width_enforce_mode=24 \
ro.audio.monitorRotation=true\
ro.vendor.audio.voice.change.support=true\
ro.vendor.audio.surround.support=true\
ro.vendor.audio.scenario.support=true\
ro.vendor.audio.spk.stereo=true\
ro.vendor.audio.vocal.support=true\
ro.vendor.audio.voice.change.youme.support=true\
ro.vendor.audio.voice.volume.boost=manual\
ro.vendor.audio.us.proximity=true \
ro.vendor.audio.us.type=mius \
ro.vendor.audio.zoom.support=true\
ro.vendor.audio.zoom.type=1 \
ro.vendor.audio.spk.clean=true \
ro.vendor.bluetooth.wipower=false \
ro.vendor.df.effect.conflict=1 \
vendor.audio.hw.aac.encoder=true \
vendor.audio.offload.track.enable=false \
vendor.audio.spkcal.copy.inhal=true \
vendor.audio.usb.disable.sidetone=true



# for HIDL related packages
PRODUCT_PACKAGES += \
    vendor.qti.hardware.audiohalext@1.0 \
    vendor.qti.hardware.audiohalext@1.0-impl \
    vendor.qti.hardware.audiohalext-utils

# enable audio hidl hal 6.0
PRODUCT_PACKAGES += \
    android.hardware.audio@6.0 \
    android.hardware.audio.common@6.0 \
    android.hardware.audio.common@6.0-util \
    android.hardware.audio@6.0-impl \
    android.hardware.audio.effect@6.0 \
    android.hardware.audio.effect@6.0-impl

# enable sound trigger hidl hal 2.2
PRODUCT_PACKAGES += \
    android.hardware.soundtrigger@2.2-impl \

# enable sound trigger hidl hal 2.3
PRODUCT_PACKAGES += \
    android.hardware.soundtrigger@2.3-impl \


ifeq ($(strip $(AUDIO_FEATURE_ENABLED_DEV_ARBI)),true)
PRODUCT_PACKAGES_DEBUG += \
    libaudiodevarb
endif



ifeq ($(strip $(AUDIO_FEATURE_ENABLED_3D_AUDIO)),true)
PRODUCT_PACKAGES_DEBUG += \
    libvr_object_engine \
    libvr_amb_engine \
    libhoaeffects_csim
endif


ifeq ($(strip $(BOARD_SUPPORTS_SOUND_TRIGGER)),true)
PRODUCT_PACKAGES_DEBUG += \
    libadpcmdec
endif

