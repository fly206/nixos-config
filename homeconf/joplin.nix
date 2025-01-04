{}:

{
  programs.joplin-desktop = {
    enable = true;
    sync = {
      target = "onedrive";
      interval = "10m";
    };
    extraConfig = ''
    '';
  };
}
