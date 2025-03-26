#in the name of Allah
with import <nixpkgs> {};
stdenv.mkDerivation {
  name = "env";
  nativeBuildInputs = [ pkg-config ];
  buildInputs = [
    nodejs
    gtk3
    cargo-tauri
    rustc
    cargo
    gdk-pixbuf
    webkitgtk_4_1
    libsoup_3
    glibc
    fuse
    # appimagekit
    # gdk
    # glfw3
    # glew
    # xorg.libXcursor
    # xorg.libXrandr
    # xorg.libXinerama
    # xorg.libXv
    # xorg.libXt
    # xorg.libXp
    # xorg.libXi
  ];
}
