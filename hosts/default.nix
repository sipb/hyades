{ self }:

let
  mkSystem = hostName: { arch }:
    self.inputs.nixpkgs.lib.nixosSystem {
      system = arch;
      specialArgs = { inherit self; };
      modules = [ ./${hostName} ];
    };
in
builtins.mapAttrs mkSystem {
  "master" = { arch = "x86_64-linux"; };
}
