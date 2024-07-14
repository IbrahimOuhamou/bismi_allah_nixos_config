#in the name of Allah
with import <nixpkgs> {};
stdenv.mkDerivation {
  name = "env";
  nativeBuildInputs = [ pkg-config ];
  buildInputs = [
    SDL2
    SDL2_ttf
    gtk4
    glfw3
    glew
    lua
    xorg.libXcursor
    xorg.libXrandr
    xorg.libXinerama
    xorg.libXv
    xorg.libXt
    xorg.libXp
    xorg.libXi
    zig

    #pkgsCross.mingwW64.SDL2
    #pkgsCross.mingwW64.buildPackages.SDL2
  ];
}
