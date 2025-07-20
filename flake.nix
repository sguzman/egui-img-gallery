{
  description = "egui‑img‑gallery + complete Vulkan stack";

  #
  # ----- Inputs ------------------------------------------------------------
  #
  inputs = {
    nixpkgs     .url = "github:NixOS/nixpkgs/nixos-24.05";
    flake-utils .url = "github:numtide/flake-utils";
  };

  #
  # ----- Outputs -----------------------------------------------------------
  #
  outputs = { self, nixpkgs, flake-utils, ... }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system; };

        # 1. Packages you already had
        userBasePkgs = with pkgs; [
          egl-wayland expat fontconfig freetype freetype.dev libGL
          libdrm libxkbcommon llvmPackages_19.llvm mesa pkg-config wayland
          xorg.libX11 xorg.libXcursor xorg.libXi xorg.libXrandr
        ];

        # 2. Vulkan tool‑chain (vkcube sits in vulkan-tools)
        vulkanPkgs = with pkgs; [
          vulkan-loader vulkan-headers vulkan-tools
          vulkan-validation-layers vulkan-extension-layer
          glslang shaderc spirv-tools spirv-cross vma
        ];

        # 3. Optional debuggers
        debugPkgs = with pkgs; [ renderdoc gfxreconstruct apitrace ];

        buildInputs = userBasePkgs ++ vulkanPkgs ++ debugPkgs
                    ++ [ pkgs.pkg-config ];

        # Helper: make colon‑separated search paths
        mkvPath = subdir: paths:
          pkgs.lib.makeSearchPath subdir paths;

        vkICDs   = mkvPath "share/vulkan/icd.d"            buildInputs;
        vkLayers = mkvPath "share/vulkan/explicit_layer.d" buildInputs;
      in
      {
        #
        # ---- Dev shell -----------------------------------------------------
        #
        devShells.default = pkgs.mkShell {
          inherit buildInputs;

          # Uncomment the next line if you prefer to drop into Fish
          # shell = "${pkgs.fish}/bin/fish";

          shellHook = ''
            # -------- Detect WSL2 vs native Linux ---------------------------
            if grep -qi microsoft /proc/version; then
              # Helper libs for Mesa‑dzn inside WSLg
              export LD_LIBRARY_PATH=/usr/lib/wsl/lib${LD_LIBRARY_PATH:+:$LD_LIBRARY_PATH}
              echo "🪟  WSL2 detected – using host GPU via D3D12/Zink"
            else
              # Native Linux: point the loader directly at our ICD JSONs
              export VK_ICD_FILENAMES="${vkICDs}"
            fi

            # Validation / portability layers (works everywhere)
            export VK_LAYER_PATH="${vkLayers}\${VK_LAYER_PATH:+:\$VK_LAYER_PATH}"

            echo "✅  Vulkan shell ready – try:  vkcube-wayland  |  vulkaninfo | head"
          '';
        };

        #
        # ---- Package build (Rust example) ---------------------------------
        #
        packages.default = pkgs.rustPlatform.buildRustPackage {
          pname       = "egui-img-gallery";
          version     = "0.1.0";
          src         = ./.;
          cargoLock   = { lockFile = ./Cargo.lock; };
          buildInputs = buildInputs;
          # add any extra cargo features / flags here
        };
      });
}

