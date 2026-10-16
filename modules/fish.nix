{ ... }:
{
  programs.fish = {
    enable = true;

    # eza ставится в packages.cli.nix; подмена grep на ugrep ниже — только
    # когда ugrep установлен (как и раньше).
    shellAliases = {
      ls = "eza";
      ll = "eza -l --icons=auto --group-directories-first";
      l1 = "eza -1";
      "l." = "eza -d .*";
    };

    functions = {
      setup_nerdctl = {
        body = ''
          set url $(curl -s https://api.github.com/repos/containerd/nerdctl/releases/latest | grep "browser_download_url.*nerdctl-full.*-linux-amd64.tar.gz" | grep -o 'https://[^"]*')
          echo "Latest release: $url"
          curl -LSsf $url | tar xzv -C $HOME/.local
          echo "If it's a new installation don't forget to run 'containerd-rootless-setuptool.sh install'"
        '';
      };
    };

    interactiveShellInit = ''
      bind ctrl-space accept-autosuggestion

      # ublue/bazzite bling-хуки
      test -f /usr/share/bazzite-cli/bling.fish && source /usr/share/bazzite-cli/bling.fish

      # ugrep вместо grep (только если установлен)
      if type -q ug
        alias grep 'ug'
        alias egrep 'ug -E'
        alias fgrep 'ug -F'
        alias xzgrep 'ug -z'
        alias xzegrep 'ug -zE'
        alias xzfgrep 'ug -zF'
      end
    '';
  };
}
