#
# Properties for foles
#

# Camera
PRODUCT_PROPERTY_OVERRIDES += \
    persist.vendor.camera.physical.num=2

# Fingerprint
PRODUCT_PROPERTY_OVERRIDES += \
    ro.hardware.fingerprint=goodix

# Firmware
PRODUCT_PROPERTY_OVERRIDES += \
    ro.vendor.hw.modem_version=.

# HDR
PRODUCT_PROPERTY_OVERRIDES += \
    ro.vendor.display.hdr.config=/vendor/etc/hdr_tm_config.xml

# Sensor
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.hardware.sensors=foles \
    ro.vendor.sensors.mot_ltv=tru
