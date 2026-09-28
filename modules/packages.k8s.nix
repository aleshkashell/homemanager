
{ pkgs, ... }:
{
  home.packages = with pkgs; [
    age
    cilium-cli
    fluxcd
    freelens-bin
    kustomize
    kubernetes-helm
    k9s
    kubectl
    nerdctl
    sops
    talosctl
  ];
}
