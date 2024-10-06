{pkgs, ...}: {
  environment.variables = {
    EDITOR = "code";
    VISUAL = "code";
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.xen = {
    isNormalUser = true;
    extraGroups = ["wheel"]; # Enable ‘sudo’ for the user.
    shell = pkgs.fish;
  };
}
