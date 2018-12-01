# POCO-Windows

---

**Deprecated!** I've switched over to [Vcpkg](https://github.com/Microsoft/vcpkg) and will no longer maintain this repository 😊

---

Inspired by [grpc-windows](https://github.com/plasticbox/grpc-windows) this repository provides fully automated build scripts for the [POCO C++ libraries](https://pocoproject.org/) on Windows. While building POCO on Windows by itself is pretty straightforward I missed the convenience of having a [NuGet](https://www.nuget.org/) package available which abstracts away the hassle of setting up your projects compiler and linker settings accordingly. This is the sole purpose of this repository: transform POCO Basic into a NuGet package!

## Requirements
 * Visual Studio **2017** (Community Edition is just fine)
 * [Git](https://git-scm.com/)
 * [NuGet Client](https://dist.nuget.org/index.html) (gets downloaded automatically)
 
## How to build
 * Clone this repository - obviously
 * Run `poco_clone.cmd`
   * This will clone the 1.8.0 branch fom the [official POCO repository](https://github.com/pocoproject/)
   * It will then download the latest [NuGet Client](https://dist.nuget.org/index.html) binary
 * Run `poco_build.cmd`
   * This will build POCO **Basic** components for
     * x86 and x64 architectures
     * Release and Debug build
     * Shared and Static libraries
   * Finally a NuGet package will be created, including all of the resulting binaries
   
## Restrictions
  * POCO version is currently hard-coded to 1.8.0
  * Build environment only covers Visual Studio 2017 (MSVC 15.0)
  * Only POCO Basic components are built
  
 These might get resolved in future updates but currently this setup satisfies my needs (and maybe yours too).
 
## That's still too much work!
 Right, I hear ya! If you want it even faster you can [use my pre-built package](https://www.nuget.org/packages/poco-basic-windows-v140/) right away. It's currently unlisted because of the restrictions I listet earlier. If they don't bother you, use the package!
