#بسم الله الرحمن الرحيم
#la ilaha illa Allah mohammed rassoul Allah


#THIS IS NOT COMPLETE

#with import <nixpkgs> { crossSystem = { config = "x86_64-w64-mingw32"; }; };
with import <nixpkgs> { hostPlatform.config = "x86_64-windows"; };
stdenv.mkDerivation {
  pname = "bismi_allah_cross_compiling";
  version = "0.1";

  buildInputs = [
    #pkgsCross.mingwW64
    #SDL2
    pkgsCross.mingwW64.buildPackages.libgcc
    pkgsCross.mingwW64.buildPackages.gcc
    pkgsCross.mingwW64.buildPackages.gnumake
    pkgsCross.mingwW64.buildPackages.pkg-config
    pkgsCross.mingwW64.SDL2
    #pkgsCross.mingwW64.SDL2_ttf

    #pkgsCross.mingwW64.buildPackages.SDL
    #pkgsCross.mingwW64.buildPackages.SDL_ttf
    #pkgsCross.mingwW64.buildPackages.SDL2
    #pkgsCross.mingwW64.buildPackages.windows.mingw_w64_headers
    #pkgsCross.mingwW64.buildPackages.SDL2.all
    #pkgsCross.mingwW64.buildPackages.SDL2_ttf
  ];

}


