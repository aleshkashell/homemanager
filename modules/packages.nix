{ pkgs, ... }:
{
  home.packages = with pkgs; [
    chezmoi
    eza
    fd
    go
    k9s
    kubectl
    nerdctl
    telegram-desktop
    zoxide
  ];
}
