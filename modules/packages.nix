{ pkgs, ... }:
{
  home.packages = with pkgs; [
    go
    nerdctl
    telegram-desktop
  ];
}
