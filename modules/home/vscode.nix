{pkgs, ...}: {
  programs.vscode = {
    enable = true;
    package = pkgs.vscode.override {
      commandLineArgs = [
        "--ozone-platform-hint=auto"
        "--ozone-platform=wayland"
        # make it use GTK_IM_MODULE if it runs with Gtk4, so fcitx5 can work with it.
        # (only supported by chromium/chrome at this time, not electron)
        "--gtk-version=4"
        # make it use text-input-v1, which works for kwin 5.27 and weston
        "--enable-wayland-ime"
      ];
    };

    userSettings = {
      # Nix IDE
      "nix.enableLanguageServer" = true;
      "nix.serverPath" = "nil";
      "nix.serverSettings" = {
        "nil" = {
          "formatting" = {
            "command" = ["alejandra"];
          };
        };
      };
      # Settings
      "editor.formatOnSave" = true;
      "window.titleBarStyle" = "custom";
      # Auto save
      "files.autoSave" = "afterDelay";
      "files.autoSaveDelay" = 300;
      # Disable auto extension update
      "extensions.autoUpdate" = false;
      # Disable telemetry
      "telemetry.telemetryLevel" = "off";
      # Vscode icons
      "workbench.productIconTheme" = "fluent-icons";
      # Dir & files icons
      "workbench.iconTheme" = "material-icon-theme";
    };

    extensions = with pkgs.vscode-extensions; [
      jnoortheen.nix-ide
    ];
  };
}
