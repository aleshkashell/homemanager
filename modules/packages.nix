{ pkgs, ... }:
{
  home.packages = with pkgs; [
    chezmoi
    eza
    fd
    go
    kubernetes-helm
    k9s
    kubectl
    nerdctl
    telegram-desktop
    zoxide
  ];
}
