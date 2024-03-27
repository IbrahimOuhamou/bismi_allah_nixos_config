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
    #pkgsCross.mingwW64.buildPackages.gcc
  ];
}
