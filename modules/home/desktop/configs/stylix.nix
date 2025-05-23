{pkgs, ...}: {
  enable = true;
  polarity = "dark";

  base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-macchiato.yaml";

  fonts = {
    monospace = {
      package = pkgs.nerd-fonts.jetbrains-mono;
      name = "JetBrains Mono Nerd Font";
    };

    sizes = {
      terminal = 11;
      desktop = 10;
      applications = 11;
    };
  };

  targets.nvf.enable = false;
}
