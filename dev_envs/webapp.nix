# بسم الله الرحمن الرحيم
# la ilaha illa Allah Mohammed Rassoul Allah
with import <nixpkgs> {};
stdenv.mkDerivation {
  name = "react-bootstrap-shell";
  buildInputs = with pkgs; [
    nodePackages.create-react-app
    create-react-app
    nodejs
    yarn
  ];

  shellHook = ''
    npm config set prefix ~/.cache/npm/modules/
  '';
}
