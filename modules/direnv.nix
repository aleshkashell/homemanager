{ ... }:
{
  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };

  # Shell configs are not managed by Home Manager yet, so hooks are dropped
  # as standalone files each shell picks up on its own. Once a shell moves to
  # programs.<shell>.enable, remove its entry here and rely on
  # programs.direnv's default enable<Shell>Integration.
  home.file = {
    ".bashrc.d/direnv.sh".text = ''
      if command -v direnv >/dev/null; then
        eval "$(direnv hook bash)"
      fi
    '';
    # zsh has no drop-in directory here; .zshenv is not managed elsewhere.
    # The interactive guard keeps non-interactive zsh (scripts) hook-free.
    ".zshenv".text = ''
      if [[ -o interactive ]] && command -v direnv >/dev/null; then
        eval "$(direnv hook zsh)"
      fi
    '';
    ".config/fish/conf.d/direnv.fish".text = ''
      if command -q direnv
        direnv hook fish | source
      end
    '';
  };
}
