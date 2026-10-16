{
  home.username = "asheludchenkov";
  home.homeDirectory = "/home/asheludchenkov";

  home.sessionPath = [
     "$HOME/.ai-tools/claude-code:$PATH"
     "$HOME/.ai-tools/kilocode:$PATH"
     "$HOME/.ai-tools/opencode:$PATH"
     "$HOME/.ai-tools/openclaude:$PATH"
  ];

  # Adjust identity for this profile if needed.
  programs.git.settings.user = {
    name = "Sheludchenkov Aleksei";
    email = "asheludchenkov@usergate.com";
  };
  programs.git.settings.init = {
    defaultBranch = "dev";
  };
  programs.git.settings.push = {
    autoSetupRemote = true;
  };
}
