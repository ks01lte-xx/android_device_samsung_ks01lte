#!/usr/bin/env -S PYTHONPATH=../../../tools/extract-utils python3
#
# SPDX-FileCopyrightText: 2024 The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

from extract_utils.fixups_blob import (
    blob_fixup,
    blob_fixups_user_type,
)

from extract_utils.main import (
    ExtractUtils,
    ExtractUtilsModule,
)

blob_fixups: blob_fixups_user_type = {
    'vendor/lib/libsec-ril.so': blob_fixup()
        .replace_needed('libhidltransport.so', 'libcutils-v29.so')
        .replace_needed('libprotobuf-cpp-full.so', 'libprotobuf-cpp-full-v23.so'),
    'vendor/lib/mediadrm/libwvdrmengine.so': blob_fixup()
        .replace_needed('libprotobuf-cpp-lite.so', 'libprotobuf-cpp-lite-v29.so'),
    'vendor/lib/libbccQTI.so': blob_fixup()
        .replace_needed('libLLVM.so', 'libLLVM_android.so'),
    'vendor/lib/hw/camera.vendor.msm8974.so': blob_fixup()
        .add_needed('libshim_camera.so'),
    'vendor/lib/libperipheral_client.so': blob_fixup()
        .add_needed('libshim_binder.so'),
    'vendor/lib/libarcsoft_nighthawk.so': blob_fixup()
        .fix_soname(),
#    ('vendor/bin/thermal-engine', 'vendor/lib/libmmcamera2_sensor_modules.so'): blob_fixup()
#        .('/system/etc', r'/vendor/etc'),
#    ('vendor/bin/mpdecision', 'vendor/lib/libsam.so'): blob_fixup()
#        .('/data/system', r'/data/vendor'),
#    'vendor/lib/libmmcamera2_sensor_modules': blob_fixup()
#        .('/system/lib', r'/vendor/lib')
#        .('/system/cameradata', r'vendor/cameradata'),
}

module = ExtractUtilsModule(
    'ks01lte',
    'samsung',
    blob_fixups=blob_fixups,
)

if __name__ == '__main__':
    utils = ExtractUtils.device(module)
    utils.run()
