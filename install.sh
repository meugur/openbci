#!/bin/bash

set +e

OPENBCI_RELEASE="openbcigui_v5.1.0_2022-05-27_17-35-19_linux64.zip"
OPENBCI_DOWNLOAD="https://github.com/OpenBCI/OpenBCI_GUI/releases/download/v5.1.0/${OPENBCI_RELEASE}"

if [ ! -d OpenBCI_GUI ]; then
  echo "Installing OpenBCI GUI v5.1.0"
  wget $OPENBCI_DOWNLOAD
  unzip $OPENBCI_RELEASE
else 
  echo "OpenBCI GUI is available"
fi
