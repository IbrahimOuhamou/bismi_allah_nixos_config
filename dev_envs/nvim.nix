#in the name of Allah
with import <nixpkgs> {};
stdenv.mkDerivation {
  name = "env";
  nativeBuildInputs = [];
  buildInputs = [
    nodejs

    #pkgsCross.mingwW64.SDL2
    #pkgsCross.mingwW64.buildPackages.SDL2
  ];
}
