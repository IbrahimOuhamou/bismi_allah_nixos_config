#in the name of Allah
{ pkgs ? import <nixpkgs> {} }:
{
  services.mysql =
  {
    enable = true;
    package = pkgs.mariadb;
  };
}
