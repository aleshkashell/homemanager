# Home Manager

Multi-profile Home Manager configuration. Shared configuration lives in
`home.nix` and `modules/`, per-user settings (username, home directory,
git identity, ...) live in `profiles/<profile>.nix`.

## Setup

Clone repo

```bash
git clone git@github.com:aleshkashell/homemanager.git ~/.config/home-manager
```

Run home-manager

```bash
nix-shell -p home-manager
```

## Apply

Apply the default profile (`aleshka`):

```bash
make update
```

Apply a specific profile:

```bash
make update PROFILE=asheludchenkov
# or
make asheludchenkov
```

## Per-profile packages

All modules receive the profile name as the `name` argument (see
`extraSpecialArgs` in `flake.nix`). To install a package only for some
profiles, gate it with `lib.optionals` in the module:

```nix
{ pkgs, lib, name, ... }:
{
  home.packages =
    (with pkgs; [ thunar telegram-desktop ])
    ++ lib.optionals (name == "aleshka") [ amnezia-vpn-wrapped ];
}
```

A profile can also add extra packages for itself by defining `home.packages`
in `profiles/<profile>.nix` — package lists from all modules are concatenated.

## Add a new profile

1. Create `profiles/<profile>.nix` with at least `home.username` and
   `home.homeDirectory`.
2. Add `<profile> = mkProfile "<profile>";` to `homeConfigurations` in
   `flake.nix`.
