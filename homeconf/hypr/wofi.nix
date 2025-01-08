{ config, pkgs, ... }:

{
  programs.wofi = {
    enable = true;
    settings = {
      show = "drun";
      always_parse_args = true;
      show_all = false;
      insensitive = true;
      allow_images = true;
      normal_window = true;
      allow_markup = true;
    };
    style = ''
        #window {
            background-color: rgba(45, 48, 59, 0.9);
            border: 1px solid rgb(124, 131, 137);
            font-family: monospace;
            font-size: 16px;
            color: rgb(196, 203, 212);
        }

        #outer-box {
            padding: 5px;
        }

        #input {
            box-shadow: none;
            background: transparent;
            border: none;
            border-bottom: 2px solid rgb(29, 31, 33);
            border-radius: 0;margin-bottom: 1px;
            padding-left: 4px;
        }

        #input:focus {
            border: none;
            border-bottom: 2px solid rgb(29, 31, 33);
        }

        #entry {
            background-color: rgba(45, 48, 59, 0.95);
            margin: 1px 0;
            border-radius: 0;
        }

        #entry:nth-child(2n) {
            background-color: rgba(64, 69, 82, 0.59);
        }

        #entry:selected {
            background-color: rgb(64, 132, 214);
            color: rgb(249, 249, 249);
        }

        #img {
            margin: -1px 8px -1px 0;
        }
    '';
  };
}
