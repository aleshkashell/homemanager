{ pkgs, ... }:
{
  home.packages = with pkgs; [
    chezmoi
    cilium-cli
    eza
    fd
    go
    go-task
    kubernetes-helm
    k9s
    kubectl
    nerdctl
    talosctl
    telegram-desktop
    zoxide
  ];
}
