# $(call add-radio-file-sha1-checked,path,sha1)
define add-radio-file-sha1-checked
  $(eval path := $(LOCAL_PATH)/$(1))
  $(eval sha1 := $(shell sha1sum "$(path)" | cut -d" " -f 1))
  $(if $(filter $(sha1),$(2)),
    $(call add-radio-file,$(1)),
    $(error $(path) SHA1 mismatch ($(sha1) != $(2))))
endef

# Enforce privapp-permissions whitelist
PRODUCT_VENDOR_PROPERTIES += \
    ro.control_privapp_permissions=enforce

# Audio
include vendor/custom/config/audio.mk

# Bootanimation
PRODUCT_COPY_FILES += \
    vendor/custom/bootanimation/bootanimation.zip:$(TARGET_COPY_OUT_PRODUCT)/media/bootanimation.zip \
    vendor/custom/bootanimation/bootanimation-dark.zip:$(TARGET_COPY_OUT_PRODUCT)/media/bootanimation-dark.zip

# Charger
PRODUCT_COPY_FILES += \
    vendor/custom/charger/images/battery_fail.png:$(TARGET_COPY_OUT_VENDOR)/etc/res/images/charger/battery_fail.png \
    vendor/custom/charger/images/battery_overheat.png:$(TARGET_COPY_OUT_VENDOR)/etc/res/images/charger/battery_overheat.png \
    vendor/custom/charger/images/battery_scale.png:$(TARGET_COPY_OUT_VENDOR)/etc/res/images/charger/battery_scale.png \
    vendor/custom/charger/images/main_font.png:$(TARGET_COPY_OUT_VENDOR)/etc/res/images/charger/main_font.png \
    vendor/custom/charger/values/animation.txt:$(TARGET_COPY_OUT_VENDOR)/etc/res/values/charger/animation.txt

# Fonts
PRODUCT_COPY_FILES += \
    vendor/custom/fonts/fonts_customization.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/fonts_customization.xml \
    vendor/custom/fonts/GoogleSans-Italic.ttf:$(TARGET_COPY_OUT_PRODUCT)/fonts/GoogleSans-Italic.ttf \
    vendor/custom/fonts/GoogleSans-Regular.ttf:$(TARGET_COPY_OUT_PRODUCT)/fonts/GoogleSans-Regular.ttf \
    vendor/custom/fonts/GoogleSansClock-Regular.ttf:$(TARGET_COPY_OUT_PRODUCT)/fonts/GoogleSansClock-Regular.ttf \
    vendor/custom/fonts/GoogleSansFlex-Regular.ttf:$(TARGET_COPY_OUT_PRODUCT)/fonts/GoogleSansFlex-Regular.ttf \
    vendor/custom/fonts/GoogleSansFlexClock-Regular.ttf:$(TARGET_COPY_OUT_PRODUCT)/fonts/GoogleSansFlexClock-Regular.ttf

# GMS
$(call inherit-product, vendor/google/gms/config.mk)

# Packages
include vendor/custom/config/packages.mk
