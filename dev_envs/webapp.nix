# بسم الله الرحمن الرحيم
# la ilaha illa Allah Mohammed Rassoul Allah
with import <nixpkgs> {};
stdenv.mkDerivation {
  name = "react-bootstrap-shell";
  buildInputs = with pkgs; [
    nodejs
  ];

  shellHook = ''
    npm config set prefix ~/.cache/npm/modules/
  '';
}
