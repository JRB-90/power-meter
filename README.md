# power-meter
Bike crank arm based power meter using nRF52840, IMU and strain gauge to measure and transmit power over ANT+.

CMake files originally forked from [nRF5-cmake-scripts](https://github.com/NRB-Tech/nRF5-cmake-scripts/tree/master).

## Setup

### Dependencies

- [JLink](https://www.segger.com/downloads/jlink/#J-LinkSoftwareAndDocumentationPack) by Segger - interface software for the JLink familiy of programmers
- [Nordic command line tools](https://www.nordicsemi.com/Software-and-tools/Development-Tools/nRF-Command-Line-Tools/Download#infotabs) (`nrfjprog` and `mergehex`) by Nordic Semiconductor - Wrapper utility around JLink
- [Python](https://www.python.org/downloads/)
- [Nordic nrfutil](https://infocenter.nordicsemi.com/index.jsp?topic=%2Fug_nrfutil%2FUG%2Fnrfutil%2Fnrfutil_intro.html) by Nordic Semiconductor - a utility for generating DFU packages
- [ARM GNU Toolchain](https://developer.arm.com/tools-and-software/open-source-software/developer-tools/gnu-toolchain/gnu-rm/downloads) by ARM and the GCC Team - compiler toolchain for embedded (= bare metal) ARM chips

### Environment Variables

### Build Steps

- Check out and CMake configure (Note: Must use 'Unix Makefiles' as CMake generator as this is incompatable with Ninja etc)
- Build 'download' target to automartically download the NRF SDK and Mesh SDK into the toolchain folder
- Now CMake configure again and you should see a series of targets for each project become available
