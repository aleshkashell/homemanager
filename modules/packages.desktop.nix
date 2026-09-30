{ pkgs, ... }:
{
  home.packages = with pkgs; [
    thunar
    telegram-desktop
  ];
}
