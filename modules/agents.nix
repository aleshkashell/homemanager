{ ... }:

let
  instructions = ./agent-instructions.md;
in
{
  home.file = {
    ".agents/AGENTS.md".source = instructions;
    ".claude/CLAUDE.md".source = instructions;
    ".config/opencode/AGENTS.md".source = instructions;
  };
}
