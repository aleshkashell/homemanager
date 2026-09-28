
{ pkgs, ... }:
{
  home.packages = with pkgs; [
    awscli2
    bat
    chezmoi
    eza
    fd
    go-task
    nerdctl
    pulumi
    qbittorrent-cli
    zoxide
  ];
}
