{ ... }:
{
  # fzf инициализировался вручную во всех трёх шеллах — интеграции
  # enableBash/Zsh/FishIntegration включатся сами (дефолт true).
  programs.fzf.enable = true;

  programs.zoxide = {
    enable = true;
    # В прежнем .zshrc zoxide не было (только bash и fish) — сохраняем это.
    enableZshIntegration = false;
  };

  programs.starship = {
    enable = true;
    # Starship инициализировался только в zsh.
    enableBashIntegration = false;
    enableFishIntegration = false;
  };
}
