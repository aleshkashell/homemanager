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
    talosctl
    telegram-desktop
    zoxide
  ];
}
