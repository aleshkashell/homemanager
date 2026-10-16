{ ... }:
{
  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
    # Хуки для шеллов добавляются автоматически: bash/zsh/fish теперь
    # управляются через programs.<shell> (см. bash.nix, zsh.nix, fish.nix),
    # а enableBash/Zsh/FishIntegration у direnv включены по умолчанию.
  };
}
