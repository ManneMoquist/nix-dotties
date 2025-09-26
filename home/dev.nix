{ vars, lib, pkgs, config, ...}: {
  home.packages = [
    pkgs.go
    pkgs.ruby
    pkgs.nodejs
    pkgs.yarn
    pkgs.pnpm
  ];
}
