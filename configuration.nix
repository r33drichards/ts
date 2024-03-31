{ config, pkgs, ... }:

{
  system.stateVersion = "23.05";

    services.static-web-server = {
      enable = true;
      listen = "[::]:8888";
      root = toString (pkgs.writeTextDir "nixos-test.html" ''
        <h1>Hello NixOS!</h1>
      '');
      configuration = {
        general = { directory-listing = true; };
      };
    };
}
