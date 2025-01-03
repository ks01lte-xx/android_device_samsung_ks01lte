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

import extract_utils.tools
extract_utils.tools.DEFAULT_PATCHELF_VERSION = '0_9'

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
    ('vendor/bin/thermal-engine', 'vendor/lib/libmmcamera2_sensor_modules.so'): blob_fixup()
        .sig_replace('2F 73 79 73 74 65 6D 2F 65 74 63', '2F 76 65 6E 64 6F 72 2F 65 74 63'),
    ('vendor/bin/mpdecision', 'vendor/lib/libsam.so'): blob_fixup()
        .sig_replace('2F 64 61 74 61 2F 73 79 73 74 65 6D', '2F 64 61 74 61 2F 76 65 6E 64 6F 72'),
    'vendor/lib/libmmcamera2_sensor_modules': blob_fixup()
        .sig_replace('2F 73 79 73 74 65 6D 2F 6C 69 62', '2F 76 65 6E 64 6F 72 2F 6C 69 62')
        .sig_replace('2F 73 79 73 74 65 6D 2F 63 61 6D 65 72 61 64 61 74 61', '2F 76 65 6E 64 6F 72 2F 63 61 6D 65 72 61 64 61 74 61'),
}

module = ExtractUtilsModule(
    'ks01lte',
    'samsung',
    blob_fixups=blob_fixups,
)

if __name__ == '__main__':
    utils = ExtractUtils.device(module)
    utils.run()
