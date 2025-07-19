# 📸 Picture Gallery App

Built with **Iced 0.13.1** & Rust Nightly 1.89 🦀

Welcome to the **Picture Gallery App**! 🎨 This vibrant and responsive app is built using **Rust** and **Iced 0.13.1**. Seamlessly shuffle images, tile them in customizable grids, and control their refresh rates—creating stunning dynamic galleries effortlessly. 🚀

---

## 🚀 Current Features

### 🌄 **Dynamic Image Viewer**

* [x] Display images responsively.
* [x] Customize layout and grid dimensions (3x3, 4x4, etc.).

### 🔄 **Image Shuffle**

* [ ] Shuffle images randomly in real-time.
* [ ] Customizable shuffle intervals and speeds.

### 🖼️ **Grid Collages**

* [ ] Adjustable grid sizes and resolutions.
* [ ] Automatic image resizing and padding.

### 🎞️ **Smooth Animations**

* [ ] Smooth UI transitions and visual effects.

### 📁 **Folder Monitoring (Optional)**

* [ ] Auto-refresh gallery on image folder updates.

---

## 🛠️ Quick Start

### 📌 **Requirements**

* Rust **Nightly 1.89**
* Iced **0.13.1**
* Notify **5.0** (optional folder monitoring)
* Image **0.24** (image manipulation)
* wgpu **0.12** (optional GPU effects)

### 🔧 **Installation**

Clone the repository:

```bash
git clone https://github.com/yourusername/picture-gallery-app.git
cd picture-gallery-app
```

Setup Rust:

```bash
rustup install nightly-1.89
rustup default nightly-1.89
```

Add dependencies to `Cargo.toml`:

```toml
[dependencies]
iced = "0.13.1"
notify = "5.0"
image = "0.24"
wgpu = "0.12" # optional
```

Run your app:

```bash
cargo build
cargo run
```

---

## 📑 **Concise Roadmap**

### 🚩 **Phase 1: Setup & Basics**

* [x] Project setup and dependencies
* [x] Basic UI with single image display
* [x] Grid layout and multiple image rendering

### 🚩 **Phase 2: Dynamic Adjustments**

* [ ] Image resizing based on grid dimensions
* [ ] Dynamic grid resizing
* [ ] Image refresh rates

### 🚩 **Phase 3: Shuffle & Refresh**

* [ ] Randomized shuffle functionality
* [ ] Independent image refresh mechanism

### 🚩 **Phase 4: UI & Styling**

* [ ] Enhance UI (padding, margins, themes)
* [ ] Customizable grid cell sizes

### 🚩 **Phase 5: Testing & Debugging**

* [ ] Unit tests for core functionalities
* [ ] UI responsiveness and debugging

---

## 🌟 **Future Enhancements**

These are exciting features planned beyond the current roadmap:

* 🚧 **Custom non-grid tiling**: Flexible and drag-and-drop layouts.
* 🚧 **Per-image refresh rates**: Individual refresh rates configuration.
* 🚧 **Cross-platform & Web Support**: Expand support to Windows, macOS, and Web via Tauri.
* 🚧 **Tag/Vibe Filtered Shuffle**: Shuffle images by tags or perceived mood.

---

## 🎨 **Customization & Advanced Options**

* Custom padding and grid resolution.
* Advanced GPU effects (ripples, glow) via `wgpu` or `glium`.
* Extendable animation system.

---

## 🌐 **Platform**

* Currently supports **Linux**.
* Future support for **Windows**, **macOS**, and **Web** planned.

---

## 🤝 **Contributing**

We welcome community involvement! To contribute:

1. Fork the repository.
2. Create your feature branch (`git checkout -b feature-name`).
3. Commit your changes (`git commit -am 'Add new feature'`).
4. Push to the branch (`git push origin feature-name`).
5. Submit a pull request.

---

## 📜 **License**

This project is licensed under the Creative Commons License. See [LICENSE](LICENSE) for details.

---

## 💬 **Support & Feedback**

Encounter an issue or have suggestions? Open an issue on GitHub! 🚀

---

## 🎖️ **Acknowledgements**

* **Iced 0.13.1** - Modern, declarative GUI for Rust.
* **Rust Nightly 1.89** - Reliable nightly Rust build.
* **Notify 5.0 & Image 0.24** - Essential supporting crates.
* **wgpu 0.12** - GPU-based enhancements.

---

## 🚧 **Progress Tracking**

* ✅ All roadmap tasks clearly marked.
* 📅 Track your feature completion at a glance!

---

## 📝 AI Activity Log

- **2025-07-17** Implemented basic image display and logging setup.
- **2025-07-19** Implemented grid layout for multiple images.
- **2025-07-19** Added .gitignore rules to exclude binary images.

---

🎉 **Enjoy building your beautiful, dynamic Picture Gallery with Rust & Iced!** 🎉

