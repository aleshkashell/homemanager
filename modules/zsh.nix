{ ... }:
{
  programs.zsh = {
    enable = true;

    # Было в .zshrc; HM кладёт это в .zshenv (подхватывается всеми zsh,
    # включая неинтерактивные).
    sessionVariables = {
      PATH = "$HOME/.local/bin:/var/lib/flatpak/exports/bin:$PATH";
      SSH_AUTH_SOCK = "$XDG_RUNTIME_DIR/ssh-agent.socket";
      P4CONFIG = "$HOME/.p4config";
      LIBVIRT_DEFAULT_URI = "qemu:///system";
    };

    shellAliases = {
      # lsd ставится в packages.cli.nix.
      ls = "lsd";
      l = "ls -l";
      la = "ls -a";
      lla = "ls -la";
      lt = "ls --tree";

      # Раньше было cat='batcat' — такого бинаря нет (в nixpkgs он называется
      # bat, и пакет уже стоит в packages.cli.nix).
      cat = "bat";
      rg = "rg --hidden";

      jsh = "ssh -A -J asheludchenkov@nsk01-atestagent01.esafeline.com -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null";
      jcp = "scp -A -J asheludchenkov@nsk01-atestagent01.esafeline.com -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null";
      ksh = "kitty +kitten ssh -A -J asheludchenkov@nsk01-atestagent01.esafeline.com -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null";
      fport = "ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null asheludchenkov@nsk01-atestagent01.esafeline.com -L";
      run = "nerdctl run --rm --network host -it";
      vpnup = "nmcli connection up \"UserGate IKEv2\"";
      vpndown = "nmcli connection down \"UserGate IKEv2\"";
    };

    history = {
      size = 10000;
      save = 10000;
      append = true; # setopt appendhistory
    };

    # oh-my-zsh целиком из nixpkgs: раньше требовался клон в ~/.oh-my-zsh,
    # которого не было, и .zshrc стартовал с ошибками. Тема 'emoji' из старого
    # конфига была кастомной и давно потеряна — в nixpkgs oh-my-zsh её нет;
    # prompt всё равно рисует starship.
    oh-my-zsh = {
      enable = true;
      theme = "robbyrussell";
      plugins = [ "git" ];
    };

    # Раньше подключались как custom-плагины oh-my-zsh; в HM это нативные опции.
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    # После подключения autosuggestions (order 700 в HM).
    initContent = ''
      bindkey '^ ' autosuggest-accept
    '';
  };
}
