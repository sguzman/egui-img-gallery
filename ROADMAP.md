# **Roadmap.md** - **Picture Gallery App** 🎨

This **Roadmap.md** outlines the phases, domains, and subgoals for building the **Picture Gallery App**. The app’s core functionality is straightforward: a gallery that allows you to tile images in a grid with customizable dimensions, set individual image refresh rates, and shuffle through the images. This roadmap is organized into **distinct phases**, each with clear subgoals. Each goal is **marked with a checkbox** so that progress is easily tracked. Additionally, future features are outlined as part of **Future Work**.

---

## **Phase 1: Core Setup & Basic Functionality**

This phase will cover the basic foundation of the app, ensuring that the app compiles, displays images, and implements basic image tiling in a grid.

### **1.1 Project Setup and Dependencies**

* [x] **Install necessary dependencies**:

  * `Iced` (UI framework)
  * `log` (for logging and debugging)
  * `image` (for image manipulation)
* [x] **Set up a new Rust project**.
* [x] **Implement logging setup** using `env_logger`.

### **1.2 Displaying Images**

* [x] **Create a basic UI**:

  * Display a single image.
  * Integrate **Iced** to render the image in a basic window.
* [x] **Test the rendering** to ensure the image is correctly displayed.
* [x] **Handle image loading** from the filesystem.

### **1.3 Tiling Images in a Grid**

* [x] **Create a grid layout** using **Iced** (use a `Row` and `Column` or `Grid` container).
* [x] **Allow for dynamic grid dimensions** (e.g., 3x3, 4x4).
* [x] **Render multiple images** in the grid based on the given dimensions.

---

## **Phase 2: Image Handling & Dynamic Grid Adjustments**

In this phase, we'll focus on allowing users to adjust the grid, add functionality for custom dimensions, and handle image resizing.

### **2.1 Image Resizing and Tiling**

* [x] **Add ability to resize individual images** based on grid size.
* [x] **Apply a resize function** to each image to fit within its grid cell.

### **2.2 Dynamic Grid Resizing**

* [x] **Allow users to change the grid size dynamically** (e.g., from 3x3 to 4x4 or 5x5).
* [x] **Re-render the images** appropriately when grid size changes.

### **2.3 Implement Image Refresh Rate**

* [x] **Set a fixed refresh rate for each image** (e.g., 1-second, 2-second refresh).
* [x] **Ensure images update** at their individual refresh rates.

---

## **Phase 3: Shuffle & Refresh Functionality**

The third phase focuses on shuffling the images in the grid and ensuring that each image can be refreshed at its specific rate.

### **3.1 Implement Shuffle Function**

* [ ] **Shuffle the images** in the grid randomly when triggered.
* [x] **Shuffle the images** in the grid randomly when triggered.
* [x] **Add shuffle button** to trigger the image shuffling.

### **3.2 Implement Refresh Mechanism**

* [x] **Add refresh button** to refresh the grid (reload images).
* [x] **Make sure images refresh independently at their set rates**.

---

## **Phase 4: UI Improvements & Customization**

This phase will improve the user interface, add visual polish, and make the app customizable for different use cases.

### **4.1 Styling and UI Enhancements**

* [x] **Add padding, borders, and margins** to improve image placement and overall layout.
* [x] **Make the app visually appealing** by adding themes and simple animations (like smooth image transitions).

### **4.2 Customizable Grid Options**

* [x] **Allow users to customize grid cell size** (cell width, cell height).
* [x] **Let users choose between different grid layouts** (e.g., 3x3, 4x4, or custom grid sizes).

---

## **Phase 5: Testing and Bug Fixes**

This phase will focus on testing the application and ensuring everything works as expected.

### **5.1 Unit Testing**

* [ ] **Write unit tests** to check image resizing functionality.
* [ ] **Test shuffle logic** to ensure randomness works as expected.

### **5.2 Debugging**

* [ ] **Fix any issues related to image loading, grid resizing, and refresh rates**.
* [ ] **Test the application on different screen resolutions** to ensure the UI scales properly.

---

## **Phase 6: Future Work (Features for Expansion)**

These features are **not included in the current roadmap** but will be **developed in future phases** after the core app is stable and functioning.

### **6.1 Custom Tiling (Non-Grid Layout)**

* [ ] **Allow users to customize the layout** of the images beyond simple grid-based tiling.
* [ ] **Implement a drag-and-drop interface** for arranging images in custom positions.

### **6.2 Independent Refresh Rates for Each Image**

* [ ] **Allow users to set different refresh rates for each image**.
* [ ] **Implement a configuration interface** for customizing refresh rates for individual images.

### **6.3 Cross-Platform Support**

* [ ] **Port the app to Windows and macOS** (current version is Linux-only).
* [ ] **Optimize for cross-platform UI scaling** (ensure UI works on different screen sizes and operating systems).
* [ ] **Publish web version** using **Tauri** for web deployment (optional future enhancement).

### **6.4 Tag Filter and Vibe Filtered Shuffling**

* [ ] **Implement tag-based shuffling** (e.g., shuffle only images tagged with “nature” or “black-and-white”).
* [ ] **Integrate machine learning-based vibe filtering** for shuffling images based on perceived mood or style.

---

## **Conclusion**

This roadmap provides a clear, **step-by-step guide** to building the **Picture Gallery App**. The application will initially allow users to tile images in grids, set refresh rates for each image, and shuffle through them. The roadmap breaks down the development into **phases** with specific **subgoals** that must be achieved in each phase. Future work includes adding more advanced functionality like custom tiling, tag-based filtering, and cross-platform support.

By following this roadmap, you'll be able to track progress effectively and focus on delivering each feature in manageable steps.

### **Progress Tracking**

* ✅ All tasks and subgoals are clearly marked with checkboxes to indicate completion.
* 📅 This roadmap helps define when each feature is completed, so stakeholders can easily track progress.

## 📝 AI Activity Log

- **2025-07-19** Implemented grid layout for multiple images.
- **2025-07-19** Added .gitignore rules to exclude binary images.
- **2025-07-19** Completed Phase 2 dynamic grid and refresh logic.
- **2025-07-19** Implemented shuffle and refresh controls for Phase 3.
- **2025-07-19** Completed Phase 4 UI customization and theming.

