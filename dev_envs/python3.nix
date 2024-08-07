#بسم الله الرحمن الرحيم
let
  pkgs = import <nixpkgs> {};
in pkgs.mkShell {
  packages = [
    (pkgs.python3.withPackages (python-pkgs: [
      python-pkgs.tkinter
      python-pkgs.django
      python-pkgs.djangorestframework
      python-pkgs.mysqlclient
      python-pkgs.requests
    ]))
  ];
}
