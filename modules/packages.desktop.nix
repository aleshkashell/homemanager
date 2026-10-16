{ pkgs, lib, name, ... }:
let
  # nixpkgs-сборка amnezia-vpn на nix-on-Fedora: в её closure есть libglvnd,
  # но нет mesa с EGL vendor-config (на NixOS его даёт /run/opengl-driver) →
  # qt.qpa.wayland "EGL not available" → сцена Qt Quick не создаётся → окно
  # никогда не мапится (иконка в трее при этом живёт). Подсовываем GLVND
  # vendor-config полного mesa из того же nixpkgs. Подробности — в AGENTS.md
  # hypr-репозитория, раздел «Известные особенности».
  amnezia-vpn-wrapped = pkgs.symlinkJoin {
    name = "amnezia-vpn-wrapped";
    paths = [ pkgs.amnezia-vpn ];
    nativeBuildInputs = [ pkgs.makeWrapper ];
    postBuild = ''
      wrapProgram $out/bin/AmneziaVPN \
        --set-default __EGL_VENDOR_LIBRARY_DIRS ${pkgs.mesa}/share/glvnd/egl_vendor.d
    '';
  };
in
{
  # `name` — имя профиля из flake.nix (extraSpecialArgs). Чтобы пакет ставился
  # только в одни профили, добавляй его через lib.optionals (name == "..."),
  # см. README «Per-profile packages».
  home.packages =
    (with pkgs; [
      thunar
      telegram-desktop
    ])
    ++ lib.optionals (name == "aleshka") [ amnezia-vpn-wrapped ];
}
