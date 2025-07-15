
# 📸 Picture Gallery App - Using ~~egui~~ **Iced** in Rust 🦀

Welcome to the **Picture Gallery App** built with **Rust** and **Iced**! 🎨 This app allows you to view, shuffle, and create custom collages with images from your collection. Explore the power of declarative UI, smooth animations, and customizable features with a **native Rust** GUI application. 🚀

---

## 🚀 Features

### 1. **Image Viewer** 🌄

- Display your images in a beautiful, responsive viewer.
- Customize layout and transitions.

### 2. **Image Shuffle** 🔄

- Shuffle images in a random order and enjoy a seamless slideshow.
- Customizable shuffle speed and settings.

### 3. **Collage Creator** 🖼️

- Create stunning collages from multiple images.
- Choose from different grid sizes (e.g., 3x3, 4x4, etc.).
- Adjustable padding and resizing options for the grid.

### 4. **Smooth Animations** 💫

- Smooth sliding menus, fading transitions, and custom animation effects.
- Eye-catching visual effects for menus and images.

### 5. **Folder Monitoring** 📁

- Automatically detect and load new images added to your folder in real time (optional).
- Refresh images whenever a new file is added.

---

## 🛠️ Getting Started

### Requirements

- **Rust** (Nightly 1.89)
- **Iced** (latest release)
- **Notify** (for folder monitoring)
- **Image** (for image manipulation)
- **wgpu** or **glium** (optional for GPU-based effects like shaders)

### Installation Steps

1. **Clone the repository** 🖥️:

   ```bash
   git clone https://github.com/yourusername/picture-gallery-app.git
   cd picture-gallery-app


2. **Install Rust** (Nightly 1.89):

   ```bash
   rustup install nightly-1.89
   rustup default nightly-1.89
   ```

3. **Add Dependencies** 📦:
   Modify the `Cargo.toml` file with the following dependencies:

   ```toml
   [dependencies]
   iced = "0.3"  # Latest Iced release
   notify = "5.0"
   image = "0.24"
   wgpu = "0.12"  # For GPU-based effects (optional)
   ```

4. **Build and Run** 🚀:

   ```bash
   cargo build
   cargo run
   ```

---

## 🖼️ App Layout & Modules

### 1. **Model** 🧠

- Holds the application's state (image list, shuffled state, current image, etc.).
- Responsible for logic like shuffling images and managing collage grids.

### 2. **View** 👀

- Renders the UI using Iced’s widgets.
- Displays images, buttons, and handles layout (grids, image viewers, etc.).
- Implements smooth animations and effects.

### 3. **Events** ⚡

- Handles user interactions like button clicks (e.g., shuffle, change grid size).
- Updates the UI state based on user inputs.

### 4. **Image Handling** 🖼️

- Manages loading and resizing images using the `image` crate.
- Optimizes image memory usage for smoother performance.

### 5. **Animations** 🎞️

- Implements smooth transitions and custom animations for the gallery and menus.
- Utilizes **Iced**'s `animated` widget for smooth UI effects.

### 6. **Folder Monitoring** 📂

- Monitors folders for changes (optional).
- Automatically refreshes images whenever a new file is added.

---

## 🎨 Customization

You can easily customize the app to suit your needs!

### Image Layout

- Change the grid size of collages (3x3, 4x4, etc.).
- Set custom padding between images in the grid.

### Shuffle Settings

- Control the shuffle speed and randomness.
- Adjust how often images are shuffled in the slideshow mode.

### Animations

- Add your own custom animations, like fading, sliding, or even advanced GPU-powered shaders for effects like ripples and glowing outlines (via **wgpu** or **glium**).
- Smooth transitions between images for a seamless experience.

---

## 🖥️ Running the App

### Slideshow Mode 🎞️

- Press the "Shuffle" button 🔄 to start the slideshow.
- Automatically cycle through images with smooth transitions.

### Collage Mode 🖼️

- Choose a grid size (e.g., 3x3) and watch your images come together in beautiful collages.
- Adjust padding and resizing as needed.

---

## 🔧 Advanced Customization (Optional)

If you want to take things a step further, you can experiment with **GPU-powered effects** like:

- **Ripples** 🌊: Add interactive water ripple effects on images.
- **Outline Shining** ✨: Create glowing outlines around selected images for a stunning visual effect.
- **Real-time Filters** 🎨: Apply custom shaders to your images in real time for unique artistic effects.

To enable GPU-based effects, you can integrate **wgpu** or **glium** for high-performance rendering. Check the **wgpu** documentation for how to add custom shaders to your project.

---

## 🌍 Cross-Platform

This app is **cross-platform**, so you can run it on **Windows**, **Linux**, and **macOS**! 🌏 You can even extend it to the **Web** using **Iced**'s web support, giving you the flexibility to deploy across various environments. 🌐

---

## 🤝 Contributing

We welcome contributions! If you'd like to contribute, feel free to fork the repository and make a pull request. Please follow these steps:

1. Fork the repository.
2. Create your feature branch (`git checkout -b feature-name`).
3. Commit your changes (`git commit -am 'Add new feature'`).
4. Push to the branch (`git push origin feature-name`).
5. Create a new pull request.

---

## 📝 License

This project is licensed under the Creative Commons License - see the [LICENSE](LICENSE) file for details.

---

## 👨‍💻 Support & Feedback

If you have any questions or run into any issues, feel free to open an issue on GitHub! 🚀

---

## 🏆 Acknowledgements

- **Iced**: A beautiful Rust library for building desktop applications.
- **Rust**: The programming language that makes this app fast and safe!
- **wgpu**/**glium**: For adding advanced GPU effects (optional).
- **Notify**: For folder monitoring and dynamic image updates.

---

## 🧑‍💻 **Project Showcase** ✨

Here’s a preview of what your app might look like:

![Screenshot of Picture Gallery App](path_to_screenshot)

---

### 🎉 Enjoy building your **Picture Gallery App** with **Rust** and **Iced**! 🎉

```

---

### Highlights:
- **Emojis** are used throughout the README to make it visually engaging and fun! 🎉
- The structure is detailed and informative, covering all the main features of the project.
- **Cross-platform support** is emphasized, and customization options are clearly laid out.
- **Advanced customization** (GPU effects like ripples and glowing outlines) is mentioned for flexibility in the future.

Let me know if you'd like me to adjust anything or add more sections to this!
```
