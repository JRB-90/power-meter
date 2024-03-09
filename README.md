# power-meter
Power meter using nRF52840, IMU and strain gauge to measure and transmit power over ANT+

## Setup

### Dependencies

### Environment Variables

### Build Steps

- Check out and CMake configure (Note: Must use 'Unix Makefiles' as CMake generator as this is incompatable with Ninja etc)
- Build 'download' target to automartically download the NRF SDK and Mesh SDK into the toolchain folder
- Now CMake configure again and you should see a series of targets for each project become available
