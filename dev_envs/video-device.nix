# In the name of Allah
{ pkgs ? import <nixpkgs> {}, stdenv ? pkgs.stdenv }:

let
  # Dynamically determine feature flags based on the platform
  alsaSupport = stdenv.hostPlatform.isLinux && !stdenv.hostPlatform.isAndroid;
  dbusSupport = stdenv.hostPlatform.isLinux;
  drmSupport = stdenv.hostPlatform.isLinux;
  jackSupport = stdenv.hostPlatform.isLinux;
  libdecorSupport = stdenv.hostPlatform.isLinux;
  libudevSupport = stdenv.hostPlatform.isLinux;
  openglSupport = stdenv.hostPlatform.isLinux || stdenv.hostPlatform.isDarwin;
  pipewireSupport = stdenv.hostPlatform.isLinux;
  pulseaudioSupport = stdenv.hostPlatform.isLinux;
  sndioSupport = stdenv.hostPlatform.isLinux;
  waylandSupport = stdenv.hostPlatform.isLinux;
  x11Support = stdenv.hostPlatform.isLinux;

  # Collect runtime dependencies like SDL3 does
  dlopenBuildInputs = with pkgs; [
    vulkan-headers
    vulkan-loader
  ] ++ lib.optionals alsaSupport [ alsa-lib ]
    ++ lib.optionals dbusSupport [ dbus ]
    ++ lib.optionals drmSupport [ libdrm libgbm ]
    ++ lib.optionals jackSupport [ libjack2 ]
    ++ lib.optionals libdecorSupport [ libdecor ]
    ++ lib.optionals libudevSupport [ systemdLibs ]
    ++ lib.optionals openglSupport [ libGL ]
    ++ lib.optionals pipewireSupport [ pipewire ]
    ++ lib.optionals pulseaudioSupport [ libpulseaudio ]
    ++ lib.optionals sndioSupport [ sndio ]
    ++ lib.optionals waylandSupport [ libxkbcommon wayland ]
    ++ lib.optionals x11Support [
      xorg.libX11
      xorg.libXScrnSaver
      xorg.libXcursor
      xorg.libXext
      xorg.libXfixes
      xorg.libXi
      xorg.libXrandr
    ];

in
pkgs.mkShell {
  name = "video-device";

  nativeBuildInputs = with pkgs; [ pkg-config ];

  buildInputs = dlopenBuildInputs;

  shellHook = ''
    export LD_LIBRARY_PATH=${pkgs.lib.makeLibraryPath dlopenBuildInputs}:$LD_LIBRARY_PATH
  '';
}
