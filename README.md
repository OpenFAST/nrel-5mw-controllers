# NREL 5MW Reference Turbine Controllers

The controllers included in this repository correspond to various configurations
for the NREL 5MW Reference Wind Turbine. The were previously included in the
[OpenFAST r-test](https://github.com/openfast/r-test) repository for use in
the OpenFAST regression tests. While they are still used there, the
controller files are housed in this repository and automatically distributed
via package managers.

## Compile
These controllers can be compiled via CMake. A Fortran compiler is the only
dependency. To compile, follow the command below.

```bash
mkdir build && cd build
cmake ..
make
```

A successful compile will result in the following libraries with
the appropriate extension for your system:
- DISCON.<.dll, .dylib, .so>
- DISCON_ITIBarge.<.dll, .dylib, .so>
- DISCON_OC3Hywind.<.dll, .dylib, .so>

