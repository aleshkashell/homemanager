
{ pkgs, ... }:
{
  home.packages = with pkgs; [
    awscli2
    bat
    chezmoi
    eza
    fd
    fyi
    gitlab-ci-ls
    go-task
    nerdctl
    pulumi
    qbittorrent-cli
    zoxide
  ];
}
