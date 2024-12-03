{
  description = "Onix shell";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";
    nixsecpkgs = {
      url = "github:onix-sec/nixsecpkgs";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      nixsecpkgs,
      ...
    }:
    let
      system = "x86_64-linux";
    in
    {
      devShells."${system}".default =
        let
          pkgs = import nixpkgs {
            inherit system;
            config.allowUnfree = true;
            overlays = [ nixsecpkgs.overlays.default ];
          };
        in
        pkgs.mkShell {
          packages = with pkgs; [
            # from nixsecpkgs
            awrbacs
            keyt
          ];

          shellHook = ''
            echo "Welcome to NixHack"
          '';
        };
    };
}
