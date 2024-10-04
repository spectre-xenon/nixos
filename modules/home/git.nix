{ pkgs, ... }: {
  # Github cli
  home.packages = [ pkgs.gh ];

  # basic configuration of git
  programs.git = {
    enable = true;
    userName = "Omar Zaghlool";
    userEmail = "62655598+spectre-xenon@users.noreply.github.com";
    extraConfig = {
      init.defaultBranch = "main";
    };
  };
}
