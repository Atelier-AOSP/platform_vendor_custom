# Audio
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,vendor/custom/audio,$(TARGET_COPY_OUT_PRODUCT)/media/audio)

PRODUCT_PRODUCT_PROPERTIES += \
    ro.config.alarm_alert=Fresh_morning.ogg \
    ro.config.notification_sound=Kernel.ogg \
    ro.config.ringtone=The_next_adventure.ogg
