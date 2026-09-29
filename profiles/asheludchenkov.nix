{
  home.username = "asheludchenkov";
  home.homeDirectory = "/home/asheludchenkov";

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
