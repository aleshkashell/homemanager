{ ... }:
{
  programs.bash = {
    enable = true;

    # eza ставится в packages.cli.nix; подмена grep на ugrep в initExtra ниже —
    # она должна срабатывать только когда ugrep установлен.
    shellAliases = {
      ls = "eza";
      ll = "eza -l --icons=auto --group-directories-first";
      l1 = "eza -1";
      "l." = "eza -d .*";
      grep = "grep --color=auto";
    };

    # В .bashrc до интерактивной проверки: глобальные определения Fedora,
    # PATH, drop-in каталог, preexec-хуки. Как в прежнем ~/.bashrc.
    bashrcExtra = ''
      # Source global definitions
      if [ -f /etc/bashrc ]; then
        . /etc/bashrc
      fi

      # User specific environment
      if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
        PATH="$HOME/.local/bin:$HOME/bin:$PATH"
      fi
      export PATH

      # Drop-in файлы (bling и др.)
      if [ -d ~/.bashrc.d ]; then
        for rc in ~/.bashrc.d/*; do
          if [ -f "$rc" ]; then
            . "$rc"
          fi
        done
      fi
      unset rc

      # preexec-хуки (atuin и др.)
      [[ -f ~/.bash-preexec.sh ]] && source ~/.bash-preexec.sh

      # kimi-code
      export PATH="$HOME/.kimi-code/bin:$PATH"
    '';

    # Только интерактивные shell'ы.
    initExtra = ''
      # ugrep вместо grep (только если установлен)
      if [ "$(command -v ug)" ]; then
        alias grep='ug'
        alias egrep='ug -E'
        alias fgrep='ug -F'
        alias xzgrep='ug -z'
        alias xzegrep='ug -zE'
        alias xzfgrep='ug -zF'
      fi

      setup_nerdctl() {
        url=$(curl -s https://api.github.com/repos/containerd/nerdctl/releases/latest | grep "browser_download_url.*nerdctl-full.*-linux-amd64.tar.gz" | grep -o 'https://[^"]*')
        echo "Latest release: $url"
        curl -LSsf $url | tar xzv -C $HOME/.local
        echo "If it's a new installation don't forget to run 'containerd-rootless-setuptool.sh install'"
      }

      setup_preexec() {
        curl https://raw.githubusercontent.com/rcaloras/bash-preexec/master/bash-preexec.sh -o ~/.bash-preexec.sh
      }
    '';
  };
}
