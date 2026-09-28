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

## Add a new profile

1. Create `profiles/<profile>.nix` with at least `home.username` and
   `home.homeDirectory`.
2. Add `<profile> = mkProfile "<profile>";` to `homeConfigurations` in
   `flake.nix`.
