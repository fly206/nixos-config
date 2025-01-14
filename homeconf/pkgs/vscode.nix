{ config, pkgs, ... }:

{
  programs.vscode = {
    enable = true;
    enableUpdateCheck = true;
    enableExtensionUpdateCheck = true;
    extensions = [
        pkgs.vscode-extensions.bbenoist.nix
        pkgs.vscode-extensions.ms-vscode.cmake-tools
        pkgs.vscode-extensions.ms-vscode.cpptools
        pkgs.vscode-extensions.ms-vscode.makefile-tools
    ];
  };
}
