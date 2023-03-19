#!/bin/bash

set +e

if [ ! -d OpenBCI_GUI ]; then
  echo "OpenBCI_GUI directory does not exist"
else 
  cd OpenBCI_GUI && sudo ./OpenBCI_GUI 2>&1 | tee openbci_output.log
fi
