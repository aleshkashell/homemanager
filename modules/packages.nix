{ pkgs, ... }:
{
  home.packages = with pkgs; [
    chezmoi
    cilium-cli
    claude-code
    eza
    fd
    fluxcd
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
