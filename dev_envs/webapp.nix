#in the name of Allah
with import <nixpkgs> {};
stdenv.mkDerivation {
  name = "react-bootstrap-shell";
  buildInputs = with pkgs; [
    nodePackages.create-react-app
    create-react-app
    nodejs
    yarn
  ];
}
