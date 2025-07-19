{
  description = "egui‑img‑gallery + complete Vulkan stack";

  #
  # ----- Inputs ------------------------------------------------------------
  #
  inputs = {
    # Feel free to pin a different channel; this one is the 24.05 LTS branch.
    nixpkgs      .url = "github:NixOS/nixpkgs/nixos-24.05";
    flake-utils  .url = "github:numtide/flake-utils";
  };

  #
  # ----- Outputs -----------------------------------------------------------
  #
  outputs = {
    self,
    nixpkgs,
    flake-utils,
    ...
  }:
    flake-utils.lib.eachDefaultSystem (system: let
      pkgs = import nixpkgs {inherit system;};

      #
      # 1.  Packages that were *already* in your original flake
      #
      userBasePkgs = with pkgs; [
        egl-wayland
        expat
        fontconfig
        freetype
        freetype.dev
        libGL
        libdrm
        libllvm
        libxkbcommon
        mesa
        pkg-config
        wayland
        xorg.libX11
        xorg.libXcursor
        xorg.libXi
        xorg.libXrandr
      ];

      #
      # 2.  Expanded Vulkan tool‑chain (vkcube lives in vulkan-tools)
      #
      vulkanPkgs = with pkgs; [
        vulkan-loader # libvulkan.so  + ICD discovery
        vulkan-headers # <vulkan/*.h>
        vulkan-tools # vulkaninfo, vkcube, vktrace …
        vulkan-validation-layers
        vulkan-extension-layer # portability & misc layers
        glslang
        shaderc
        spirv-tools
        spirv-cross
        vma
      ];

      #
      # 3.  Nice‑to‑have GPU debugging tools (comment out if unnecessary)
      #
      debugPkgs = with pkgs; [renderdoc gfxreconstruct apitrace];

      #
      # 4.  Final list handed to your shell & build
      #
      buildInputs =
        userBasePkgs
        ++ vulkanPkgs
        ++ debugPkgs
        ++ [pkgs.pkg-config];

      #
      # Helper to build VK search paths inside the immutable Nix store
      #
      mkvPath = subdir: paths:
        pkgs.lib.makeSearchPath subdir paths;
    in {
      #
      # ---- Interactive dev shell ----------------------------------------
      #
      devShells.default = pkgs.mkShell {
        inherit buildInputs;

        shellHook = ''
          # Tell the loader where to find ICD JSONs and explicit layers
          export VK_ICD_FILENAMES=$( ${mkvPath "share/vulkan/icd.d" buildInputs} )
          export VK_LAYER_PATH=   $( ${mkvPath "share/vulkan/explicit_layer.d" buildInputs} )

          echo "✅  Vulkan shell ready — try:  vkcube  |  vulkaninfo |head"
        '';
      };

      #
      # ---- Package build (Rust example) ---------------------------------
      #
      packages.default = pkgs.rustPlatform.buildRustPackage {
        pname = "egui-img-gallery";
        version = "0.1.0";
        src = ./.;
        cargoLock = {lockFile = ./Cargo.lock;};
        buildInputs = buildInputs;
        # add any extra cargo features / flags here
      };
    });
}
