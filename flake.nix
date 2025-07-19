{
  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = {
    nixpkgs,
    flake-utils,
    ...
  }:
    flake-utils.lib.eachDefaultSystem (
      system: let
        pkgs = import nixpkgs {
          inherit system;
        };

        buildInputs = with pkgs; [
          egl-wayland
          expat
          fontconfig
          freetype
          freetype.dev
          libGL
          libxkbcommon
          mesa
          pkg-config
          vulkan-loader
          vulkan-tools
          vulkan-validation-layers
          wayland
          xorg.libX11
          xorg.libXcursor
          xorg.libXi
          xorg.libXrandr
        ];
      in {
        devShells.default = pkgs.mkShell {
          inherit buildInputs;

          LD_LIBRARY_PATH =
            builtins.foldl' (a: b: "${a}:${b}/lib") "${pkgs.vulkan-loader}/lib" buildInputs;
        };
      }
    );
}
