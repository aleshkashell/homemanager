{ pkgs, ... }:
{
  home.packages = with pkgs; [
    amnezia-vpn
    thunar
    telegram-desktop
  ];
}
