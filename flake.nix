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
  outputs = {
    self,
    nixpkgs,
    flake-utils,
    ...
  }:
    flake-utils.lib.eachDefaultSystem (system: let
      pkgs = import nixpkgs {inherit system;};

      # 1. Packages you already had
      userBasePkgs = with pkgs; [
        egl-wayland
        expat
        fontconfig
        freetype
        freetype.dev
        libGL
        libdrm
        libxkbcommon
        libllvm
        mesa
        pkg-config
        wayland
        xorg.libX11
        xorg.libXcursor
        xorg.libXi
        xorg.libXrandr
      ];

      # 2. Vulkan tool‑chain (vkcube sits in vulkan-tools)
      vulkanPkgs = with pkgs; [
        vulkan-loader
        vulkan-headers
        vulkan-tools
        vulkan-validation-layers
        vulkan-extension-layer
        glslang
        shaderc
        spirv-tools
        spirv-cross
      ];

      # 3. Optional debuggers
      debugPkgs = with pkgs; [renderdoc gfxreconstruct apitrace];

      buildInputs =
        userBasePkgs
        ++ vulkanPkgs
        ++ debugPkgs
        ++ [pkgs.pkg-config];

      # Helper: make colon‑separated search paths
      mkvPath = subdir: paths:
        pkgs.lib.makeSearchPath subdir paths;

      vkICDs = mkvPath "share/vulkan/icd.d" buildInputs;
      vkLayers = mkvPath "share/vulkan/explicit_layer.d" buildInputs;
    in {
      #
      # ---- Dev shell -----------------------------------------------------
      #
      devShells.default = pkgs.mkShell {
        inherit buildInputs;

        # Uncomment the next line if you prefer to drop into Fish
        # shell = "${pkgs.fish}/bin/fish";

        shellHook = ''
          # -------- Detect WSL2 vs native Linux -----------------------------------
          if grep -qi microsoft /proc/version; then
            # (1) Helper libs for the d3d12/zink driver
            export LD_LIBRARY_PATH=/usr/lib/wsl/lib''${LD_LIBRARY_PATH:+:}$LD_LIBRARY_PATH

            # (2) Point the loader at *only* the d3d12 ICD JSON
            d3d12_json="$(ls /usr/share/vulkan/icd.d/*d3d12*.json 2>/dev/null)"
            if [ -n "$d3d12_json" ]; then
              export VK_ICD_FILENAMES="$d3d12_json"
              echo "🪟  WSL2 – using ICD: $d3d12_json"
            else
              echo "⚠️  WSL2 detected but d3d12 ICD JSON not found; Vulkan may fail"
            fi
          else
            # Native Linux: point the loader directly at our Nix‑built ICDs
            export VK_ICD_FILENAMES="${vkICDs}"
          fi

          # Validation / portability layers (works everywhere)
          export VK_LAYER_PATH="${vkLayers}''${VK_LAYER_PATH:+:}$VK_LAYER_PATH"

          # Optional: force X11 for winit/iced if Wayland keeps failing
          export WINIT_UNIX_BACKEND=x11
          export DISPLAY=${DISPLAY:-:0}

          echo "✅  Vulkan shell ready – try:  vkcube-wayland | vulkaninfo | head"
        '';

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
