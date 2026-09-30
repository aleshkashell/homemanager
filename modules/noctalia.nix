{ pkgs, ... }:
{
  # Noctalia is installed system-wide (Fedora RPM noctalia-git, /usr/bin/noctalia).
  # It used to be a nixpkgs build wrapped with __EGL_VENDOR_LIBRARY_DIRS ->
  # nixpkgs mesa (libglvnd's NixOS-only /run/opengl-driver path broke EGL);
  # the system build links system mesa, so no wrapper is needed anymore.

  # Declarative base config. Noctalia reads every *.toml in ~/.config/noctalia/.
  # GUI changes are saved by Noctalia to ~/.local/state/noctalia/settings.toml
  # and WIN over this file - delete that file to return to these values.
  home.file.".config/noctalia/config.toml".text = ''
    # Wallpaper management stays with awww (hyprland/execs.lua) - Noctalia
    # must not fight it. Enable here later to switch wallpapers to Noctalia.
    [wallpaper]
    enabled = false

    # Locking: the built-in lockscreen is used (PAM service "noctalia" exists in
    # /etc/pam.d since 2026-09-30 - /etc/pam.d/noctalia includes system-auth).
    # SUPER+L and idle timeouts reach it through hypridle.conf lock_cmd, which
    # prefers "noctalia msg session lock" and falls back to hyprlock when the
    # shell is not running. The action table below keeps "Lock" on that same
    # path instead of the internal lock, so there is always exactly one locker.
    [lockscreen]

    # Explicit [[shell.session.actions]] replaces the built-in table: same five
    # default actions, but "Lock" shells out to loginctl (single locker chain,
    # see above).
    [[shell.session.actions]]
    action = "lock"
    command = "loginctl lock-session"
    countdown_seconds = 0.0
    enabled = true
    glyph = ""
    label = ""
    shortcut = "1"
    variant = "default"

    [[shell.session.actions]]
    action = "logout"
    command = ""
    countdown_seconds = 0.0
    enabled = true
    glyph = ""
    label = ""
    shortcut = "2"
    variant = "default"

    [[shell.session.actions]]
    action = "lock_and_suspend"
    command = ""
    countdown_seconds = 0.0
    enabled = true
    glyph = ""
    label = ""
    shortcut = "3"
    variant = "default"

    [[shell.session.actions]]
    action = "reboot"
    command = ""
    countdown_seconds = 0.0
    enabled = true
    glyph = ""
    label = ""
    shortcut = "4"
    variant = "default"

    [[shell.session.actions]]
    action = "shutdown"
    command = ""
    countdown_seconds = 0.0
    enabled = true
    glyph = ""
    label = ""
    shortcut = "5"
    variant = "destructive"

    # Current network speed next to the network widget (sysmon stats).
    [widget.net-down]
    type = "sysmon"
    stat = "net_rx"
    network_speed_unit = "auto"
    network_speed_compact = true
    visualization = "none"

    [widget.net-up]
    type = "sysmon"
    stat = "net_tx"
    network_speed_unit = "auto"
    network_speed_compact = true
    visualization = "none"

    # Explicit end list (declaring [bar.default] replaces the whole array):
    # default widgets plus net-down/net-up after "network".
    [bar.default]
    end = ["media", "tray", "notifications", "clipboard", "network", "net-down", "net-up", "bluetooth", "volume", "brightness", "battery", "control-center", "session"]
  '';
}
