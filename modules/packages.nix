{ pkgs, ... }:
{
  home.packages = with pkgs; [
    awscli2
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
    openclaw
    opencode
    pnpm
    qbittorrent-cli
    rustup
    talosctl
    telegram-desktop
    zoxide
  ];
}
