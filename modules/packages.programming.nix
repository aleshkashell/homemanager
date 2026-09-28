
{ pkgs, ... }:
{
  home.packages = with pkgs; [
    go
    nodejs
    pnpm
    rustup
  ];
}
