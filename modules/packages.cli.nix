
{ pkgs, ... }:
{
  home.packages = with pkgs; [
    aria2
    awscli2
    bat
    chezmoi
    eza
    fd
    fio
    fyi
    gitlab-ci-ls
    go-task
    lsd
    nerdctl
    pulumi
    qbittorrent-cli
    ugrep
    zoxide
  ];
}
