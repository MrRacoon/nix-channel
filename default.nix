let
  sources = import ./nix/sources.nix;

  ohai = pkgs.writeShellScriptBin "hello" ''
    echo "Ohai there!"
  '';

  pkgs = import sources.nixpkgs {
    overlays = [
      (self: super: {
        inherit ohai;
      })
    ];
  };
in pkgs
