#in the name of Allah

with import <nixpkgs> {};
stdenv.mkDerivation {
  name = "env";
  nativeBuildInputs = [ pkg-config ];
  buildInputs = [
    php
    php83Packages.composer
    symfony-cli
  ];
}

#let
#  pkgs = import <nixpkgs> {};
#in pkgs.mkShell {
#  packages = with pkgs [
#    (pkgs.php)
#  ];
#};
