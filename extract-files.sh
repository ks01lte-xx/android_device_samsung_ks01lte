#!/bin/bash
#
# Copyright (C) 2016 The CyanogenMod Project
# Copyright (C) 2017-2020 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

set -e

DEVICE=ks01lte
VENDOR=samsung

# Load extract_utils and do some sanity checks
MY_DIR="${BASH_SOURCE%/*}"
if [[ ! -d "${MY_DIR}" ]]; then MY_DIR="${PWD}"; fi

ANDROID_ROOT="${MY_DIR}/../../.."

# If XML files don't have comments before the XML header, use this flag
# Can still be used with broken XML files by using blob_fixup
export TARGET_DISABLE_XML_FIXING=true

HELPER="${ANDROID_ROOT}/tools/extract-utils/extract_utils.sh"
if [ ! -f "${HELPER}" ]; then
    echo "Unable to find helper script at ${HELPER}"
    exit 1
fi
source "${HELPER}"

function blob_fixup() {
    case "${1}" in
	vendor/lib/libsec-ril.*)
            "${PATCHELF}" --replace-needed libcutils.so libcutils-v29.so \
                --replace-needed libprotobuf-cpp-full.so libprotobuf-cpp-full-v23.so \
                --replace-needed libprotobuf-cpp-haxx.so libprotobuf-cpp-full-v23.so \
                "${2}"
            ;;
	vendor/bin/thermal-engine)
            sed -i 's|/system/etc|/vendor/etc|g' "${2}"
            ;;
	vendor/bin/mpdecision)
            sed -i 's|/data/system|/data/vendor|g' "${2}"
            ;;
	vendor/lib/libsam.so)
            sed -i 's|/data/system|/data/vendor|g' "${2}"
            ;;
	vendor/lib/libmmcamera2_sensor_modules.so)
            sed -i 's|system/etc|vendor/etc|g;
                    s|/system/lib|/vendor/lib|g;
                    s|/system/cameradata|/vendor/cameradata|g' "${2}"
            ;;
	vendor/lib/libarcsoft_nighthawk.so)
            "${PATCHELF}" --set-soname libarcsoft_nighthawk.so "${2}"
            ;;
	vendor/lib/mediadrm/libwvdrmengine.so)
            "${PATCHELF}" --replace-needed libprotobuf-cpp-lite.so libprotobuf-cpp-lite-v29.so "${2}"
            ;;
	vendor/lib/hw/camera.vendor.msm8974.so)
            grep -q "libshim_camera.so" "${2}" || "${PATCHELF}" --add-needed "libshim_camera.so" "$2"
            ;;
	vendor/lib/libperipheral_client.so)
            grep -q "libshim_binder.so" "${2}" || "${PATCHELF}" --add-needed "libshim_binder.so" "$2"
            ;;
	vendor/lib/libbccQTI.so)
            grep -q "libLLVM_android.so" "${2}" || "${PATCHELF}" --replace-needed libLLVM.so libLLVM_android.so "${2}"
            ;;
    esac
}

# Default to sanitizing the vendor folder before extraction
CLEAN_VENDOR=true

KANG=
SECTION=

while [ "${#}" -gt 0 ]; do
    case "${1}" in
        -n | --no-cleanup)
            CLEAN_VENDOR=false
            ;;
        -k | --kang)
            KANG="--kang"
            ;;
        -s | --section)
            SECTION="${2}"
            shift
            CLEAN_VENDOR=false
            ;;
        *)
            SRC="${1}"
            ;;
    esac
    shift
done

if [ -z "${SRC}" ]; then
    SRC="adb"
fi

# Initialize the helper for device
setup_vendor "${DEVICE}" "${VENDOR}" "${ANDROID_ROOT}" false "${CLEAN_VENDOR}"

extract "${MY_DIR}/proprietary-files.txt" "${SRC}" "${KANG}" --section "${SECTION}"

"${MY_DIR}/setup-makefiles.sh"
