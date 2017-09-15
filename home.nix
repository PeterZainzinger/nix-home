{ pkgs, ... }:

with import <nixpkgs> {};

{
  home.packages = [
    pkgs.nix-repl
    pkgs.rlwrap
    pkgs.xorg.xdpyinfo # awesome/foggy seems to want it
    pkgs.htop
    pkgs.atom
    # Older version of IntelliJ IDEA can't be downloaded from JetBrains anymore
    (pkgs.idea.idea-ultimate.overrideAttrs (attrs: { version = "2017.2.4"; src = pkgs.fetchurl { url = "https://download.jetbrains.com/idea/ideaIU-2017.2.4-no-jdk.tar.gz";
                                                                                                 sha256 = "15a4799ffde294d0f2fce0b735bbfe370e3d0327380a0efc45905241729898e3"; }; }))
    pkgs.nixpkgs.tdesktop # Telegram 
    pkgs.skype
    pkgs.unstable.chromium
    pkgs.unstable.alacritty pkgs.tmux
    pkgs.translate-shell
    pkgs.xss-lock
    pkgs.vimHugeX
    pkgs.ansifilter # used to strip ANSI out in awesome extensions 
  ];


  programs.git = {
    enable = true;
    userName = "Yurii Rashkovskii";
    userEmail = "yrashk@gmail.com";
  };

  home.file.".config/alacritty/alacritty.yml" = {
    text = builtins.readFile ./alacritty.yml;
  };

  home.file.".config/fish/config.fish" = {
    text = ''
    set -x EDITOR vim
    '';
  };


  home.file.".config/fish/functions/fish_prompt.fish" = {
     text = builtins.readFile fish/fish_prompt.fish;
  };

  home.file.".vimrc" = {
    text = builtins.readFile vim/vimrc;
  };


  home.file.".config/awesome/rc.lua" = {
     text = builtins.readFile awesome/rc.lua; 
  };

  home.file.".config/awesome/theme.lua" = {
     text = builtins.readFile awesome/theme.lua; 
  };


  home.file.".config/awesome/foggy".source = fetchFromGitHub {
     owner = "k3rni";
     repo = "foggy";
     rev = "fd76b28";
     sha256 = "0lfm7kczgdlzfcc14qj8539y679lf5qcydz0xv72szn7h9wzaaiz";
  };

  home.file.".config/awesome/battery-widget".source = fetchFromGitHub {
     owner = "deficient";
     repo = "battery-widget";
     rev = "4152487";
     sha256 = "14p4c37m6s88d2dkgkv1b7xk2paj06cfdadphmhx2m2gr7c9c01f";
  };

  home.file.".config/awesome/volume-control".source = fetchFromGitHub {
     owner = "deficient";
     repo = "volume-control";
     rev = "137b19e";
     sha256 = "1xsxcmsivnlmqckcaz9n5gc4lgxpjm410cfp65s0s4yr5x2y0qhs";
  };



}
