{ pkgs, ... }:
{
  home.packages = with pkgs; [
    bat
    chezmoi
    cilium-cli
    claude-code
    eza
    fd
    fluxcd
    freelens-bin
    go
    go-task
    kubernetes-helm
    k9s
    kubectl
    nerdctl
    opencode
    talosctl
    telegram-desktop
    zoxide
  ];
}
