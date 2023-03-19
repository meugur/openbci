# openbci
Tested on Ubuntu 22.04.2 LTS with Docker v20.10.8

Support for OpenBCI v5.1.0 and OpenViBE v3.4.0

## Setup

Install OpenBCI GUI and run:

```
./install.sh && ./run_gui.sh
```

Connect the Cyton board with the Daisy board and make sure all 16 channels are
connected properly. Plug in the USB Dongle and turn on the Cyton board to PC.
Make sure that the connection works through the GUI and set the channels to 16.

Setup OpenViBE:
```
cd openvibe
docker build -t openvibe .
./start.sh
```

Once in the container, manually build the project 
(TODO: fix `install_dependencies.sh` with docker build):
```
cd openvibe-3.4.0-src && ./install_dependencies.sh && ./build.sh
```
In a host terminal, commit the build to the image:
```
docker commit $(docker ps --filter "name=openvibe-container" --format "{{.ID}}") openvibe
```

## Experiment
Add X authentication. Get the hexkey from the host:
```
xauth list | awk 'NR==1{print $3}'
```
Then, in the container:
```
touch /root/.Xauthority
xauth add $DISPLAY . hexkey
```

Start the acquisition server in the openvibe container:
```
cd openvibe-3.4.0-src/dist/Release && ./openvibe-acquisition-server.sh &
```

Select the OpenBCI driver and set the driver properties to enable Daisy.
Start session in OpenBCI then connect with the acquisition server.

Start the OpenViBE Designer:
```
cd openvibe-3.4.0-src/dist/Release && ./openvibe-designer.sh &
```

Load the correct scenario (e.g. `bci-examples/p300-speller-xDAWN`).

Once loaded, press play on the acquisition server and then press play in the
designer. This should open a window with the scenario GUI.
