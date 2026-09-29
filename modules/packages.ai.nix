
{ pkgs, ... }:
{
  home.packages = with pkgs; [
    claude-code
    # openclaw
    opencode
  ];
}
