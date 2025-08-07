{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
  };

  outputs =
    {
      self,
      nixpkgs,
    }:
    let
      # Setup packages
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };

      # System dependencies
      buildInputs = with pkgs; [
        pkg-config
        glfw
        libGL
        xorg.libX11
      ];
    in
    {
      devShells.${system} = {
        default = pkgs.mkShell {
          inherit buildInputs;
          shellHook = with pkgs; ''
            export LD_LIBRARY_PATH="${lib.makeLibraryPath buildInputs}"
          '';
        };
      };
    };
}
