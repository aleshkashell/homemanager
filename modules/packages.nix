{ pkgs, ... }:
{
  home.packages = with pkgs; [
    chezmoi
    eza
    fd
    go
    helm
    k9s
    kubectl
    nerdctl
    telegram-desktop
    zoxide
  ];
}
