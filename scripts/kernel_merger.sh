#!/usr/bin/env bash
# SPDX-License-Identifier: Apache-2.0
# SPDX-FileCopyrightText: Z7G4N1U8 (Peace)

DEFAULT_TAG=MMI-W1UM36H.19-13-4

merge() {
  local SUBTREE=$1
  local REPO=https://github.com/MotorolaMobilityLLC/$2.git
  local TAG=${3:-$DEFAULT_TAG}

  echo "=== Processing $REPO ($TAG) ==="
  git fetch $REPO $TAG
  
  if [ $SUBTREE == root ]; then
    git merge FETCH_HEAD
  else
    git merge -X subtree=$SUBTREE FETCH_HEAD
  fi

  read -p "Press ENTER to continue "
}

if [ $1 == modules ]; then
  merge "motorola"                                "motorola-kernel-modules"
  merge "qcom/opensource/audio-kernel"            "vendor-qcom-opensource-audio-kernel"
  merge "qcom/opensource/bt-kernel"               "vendor-qcom-opensource-bt-kernel"
  merge "qcom/opensource/camera-kernel"           "vendor-qcom-opensource-camera-kernel"
  merge "qcom/opensource/dataipa"                 "kernel-msm-techpack-dataipa"
  merge "qcom/opensource/datarmnet-ext"           "vendor-qcom-opensource-datarmnet-ext"
  merge "qcom/opensource/datarmnet"               "vendor-qcom-opensource-datarmnet"
  merge "qcom/opensource/display-drivers"         "kernel-msm-5.4-techpack-display"
  merge "qcom/opensource/eva-kernel"              "vendor-qcom-opensource-eva-kernel"
  merge "qcom/opensource/graphics-kernel"         "vendor-qcom-opensource-graphics-kernel"
  merge "qcom/opensource/mm-drivers"              "vendor-qcom-opensource-mm-drivers"
  merge "qcom/opensource/mmrm-driver"             "vendor-qcom-opensource-mmrm-driver"
  merge "qcom/opensource/securemsm-kernel"        "vendor-qcom-opensource-securemsm-kernel"
  merge "qcom/opensource/video-driver"            "vendor-qcom-opensource-video-driver"
  merge "qcom/opensource/wlan/fw-api"             "vendor-qcom-opensource-wlan-fw-api"
  merge "qcom/opensource/wlan/qcacld-3.0"         "vendor-qcom-opensource-wlan-qcacld-3.0"
  merge "qcom/opensource/wlan/platform"           "vendor-qcom-opensource-wlan-platform"
  merge "qcom/opensource/wlan/qca-wifi-host-cmn"  "vendor-qcom-opensource-wlan-qca-wifi-host-cmn"
elif [ $1 == devicetree ]; then
  merge "root"          "kernel-devicetree"
  merge "qcom/audio"    "kernel-audio-devicetree"
  merge "qcom/bt"       "kernel-bt-devicetree"
  merge "qcom/camera"   "kernel-camera-devicetree"
  merge "qcom/data"     "kernel-data-devicetree"
  merge "qcom/display"  "kernel-display-devicetree"
  merge "qcom/eSE"      "kernel-eSE-devicetree"       "MMI-U2UM34.27-63-2"
  merge "qcom/eva"      "kernel-eva-devicetree"
  merge "qcom/graphics" "kernel-graphics-devicetree"
  merge "qcom/mm"       "kernel-mm-devicetree"
  merge "qcom/mmrm"     "kernel-mmrm-devicetree"
  merge "qcom/nfc"      "kernel-nfc-devicetree"
  merge "qcom/video"    "kernel-video-devicetree"
  merge "qcom/wlan"     "kernel-wlan-devicetree"
fi
