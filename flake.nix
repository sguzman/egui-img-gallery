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
        expat
        glib
        dbus
        fontconfig
        freetype
        freetype.dev
        libGL
        libdrm
        libxkbcommon
        libllvm
        mesa
        pkg-config
      ];

      # 1.5 xorg packages
      xorgPkgs = with pkgs.xorg; [
        libX11
        libXcursor
        libXi
        libXrandr
        libXext
        xcbutil
        libXrender
        libXfixes
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
        ++ xorgPkgs
        ++ vulkanPkgs
        ++ debugPkgs
        ++ [pkgs.pkg-config];

      # Helper: make colon‑separated search paths
      mkvPath = subdir: paths:
        pkgs.lib.makeSearchPath subdir paths;

      vkICDs = mkvPath "share/vulkan/icd.d" buildInputs;
      vkLayers = mkvPath "share/vulkan/explicit_layer.d" buildInputs;
      llvmpipeJSON = "${pkgs.mesa.drivers}/share/vulkan/icd.d/lvp_icd.x86_64.json";
    in {
      #
      # ---- Dev shell -----------------------------------------------------
      #
      devShells.default = pkgs.mkShell {
        inherit buildInputs;

        # Uncomment the next line if you prefer to drop into Fish
        # shell = "${pkgs.fish}/bin/fish";

        shellHook = ''
          echo "🚀 egui-img-gallery dev shell ready"

          # Let wgpu use Vulkan by default
          export WGPU_BACKEND=vulkan
          export WINIT_UNIX_BACKEND=x11
          export XDG_SESSION_TYPE=x11
          unset WAYLAND_DISPLAY

          # -------- Detect WSL2 vs native Linux -----------------------------------
          if grep -qi microsoft /proc/version; then
            export LD_LIBRARY_PATH=${nixpkgs.lib.makeLibraryPath (with pkgs; [
            vulkan-loader
            mesa
            libGL
            libxkbcommon
            xorg.libX11
            xorg.libXi
            xorg.libXcursor
            xorg.libXrandr
          ])}:$LD_LIBRARY_PATH
            export LD_LIBRARY_PATH=/usr/lib/wsl/lib''${LD_LIBRARY_PATH:+:}$LD_LIBRARY_PATH
            export VK_ICD_FILENAMES="${llvmpipeJSON}"
            echo "🪟  WSL2 – using Nix‑supplied llvmpipe ICD (${llvmpipeJSON})"
          else
            # Native Linux: point the loader directly at our Nix‑built ICDs
            export VK_ICD_FILENAMES="${vkICDs}"
          fi

          # Validation / portability layers (works everywhere)
          export VK_LAYER_PATH="${vkLayers}''${VK_LAYER_PATH:+:}$VK_LAYER_PATH"

          # Optional: force X11 for winit/iced if Wayland keeps failing
          export DISPLAY=''${DISPLAY:-:0}

          echo "✅  Vulkan shell ready – try:  vkcube-wayland | vulkaninfo | head"
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
