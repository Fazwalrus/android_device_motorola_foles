/*
 * android_memset32() was exported by libcutils up to Android 9 and dropped
 * afterwards. charge_only_mode is a Pie-era vendor blob that still links
 * against it, so without this shim it fails to load entirely:
 *
 *   CANNOT LINK EXECUTABLE "/vendor/bin/charge_only_mode":
 *   cannot locate symbol "android_memset32"
 *
 * Implementation matches the original in system/core/libcutils/memory.c:
 * size is a byte count and is required to be a multiple of 4.
 */

#include <stddef.h>
#include <stdint.h>

void android_memset32(uint32_t* dst, uint32_t value, size_t size) {
    size >>= 2;
    while (size--) {
        *dst++ = value;
    }
}
