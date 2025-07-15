# 🤖 AI Agent Guidelines for Picture Gallery App

This document provides precise, structured, and rigorous guidelines for an AI agent to incrementally and productively contribute to the **Picture Gallery App** built using Rust Nightly 1.89 and Iced 0.13.1.

---

## 🚨 Core Principles

* **Granular Iterations**: Make incremental, small changes with clear, detailed commit messages.
* **Immediate Documentation**: Every change in code or logic must be simultaneously documented.
* **Continuous Building**: Verify builds (`cargo build`) after every incremental change. Do not advance until the build succeeds.
* **Detailed Logging**: Clearly log progress in both `README.md` and `ROADMAP.md`.
* **Respect Tooling**: Use exactly Rust Nightly 1.89 and Iced 0.13.1, as defined.

---

## 🧩 Workflow for Incremental Iterations

### 1️⃣ Initialization

* Clone the repository:

  ```bash
  git clone https://github.com/sguzman/egui-img-gallery.git
  cd egui-img-gallery
  ```

* Confirm the environment:

  ```bash
  rustup default nightly-1.89
  cargo --version
  ```

### 2️⃣ Feature Development Cycle

* Create a dedicated feature branch:

  ```bash
  git checkout -b feature/feature-name
  ```

* Develop in incremental steps:

  * **Code:** Write minimal changes per commit.
  * **Build:** Run `cargo build`. **Ensure it builds successfully** before committing.
  * **Document:** Immediately update:

    * `README.md` (to log overall feature progress)
    * `ROADMAP.md` (to log specific checkbox completion)
    * Any relevant documentation (`.md` files)

### 3️⃣ Feature Completion

* Ensure the following before submitting pull requests:

  ```
  [ ] Code compiles successfully (`cargo build`).
  [ ] All tests pass (`cargo test`).
  [ ] Documentation and Markdown files updated accurately.
  [ ] Commit history is granular, clear, and descriptive.
  ```

---

## 📑 Mandatory Documentation Standards

After every incremental change, clearly reflect these changes:

* **README.md**:

  * Concise summary of implemented features
  * Version updates (if applicable)

* **ROADMAP.md**:

  * Update checkboxes immediately upon feature completion
  * Log any encountered issues clearly and how they were resolved

Example:

```markdown
### 1.2 Displaying Images

- [x] Create a basic UI
- [x] Test image rendering
- [ ] Handle image loading (**issue: image path incorrect**)
```

---

## ⚙️ Technical and Implementation Guidelines

### **File-Level Responsibilities**

* **`src/main.rs`**:

  * Main application entry point.
  * Run minimal initialization logic.

* **`src/model.rs`**:

  * Manage core app logic and state.
  * Clearly separate concerns (shuffling, grid management, current state).

* **`src/view.rs`**:

  * Handle all UI rendering logic.
  * Ensure responsive UI designs.

* **`src/image_handling.rs`**:

  * Centralized image loading and resizing.

* **`src/events.rs`**:

  * Event handling (shuffle, button clicks).

* **`src/folder_monitor.rs`**:

  * Optional: Implement and document clearly.

* **`src/animation.rs`**:

  * Optional animations clearly documented and integrated.

### **Testing & Validation**

* Use `cargo test` frequently.
* All code changes require associated unit tests.
* Document edge cases handled by tests clearly.

---

## ✅ Progress Logging Protocol

After each successful build:

* **Commit Message:**

  ```
  feat(module-name): implemented [feature/task], build successful
  ```

* **Update README.md**:

  ```markdown
  ## 🚀 Latest Updates

  - Completed `[specific feature/task]`
  - Ensured stability and compatibility with Rust Nightly 1.89 and Iced 0.13.1
  ```

* **Update ROADMAP.md** (check appropriate checkbox).

---

## 📌 Handling Issues & Failures

* If the build fails, document the failure explicitly in the commit message and update the ROADMAP.md:

  ```
  fix(module-name): resolved build failure ([brief description])
  ```
* Update `ROADMAP.md` clearly:

  ```markdown
  - [ ] Handle image loading (**build failure: missing dependency**)
  ```

---

## 🤖 AI Integration and Oversight

* Use AI tools responsibly:

  * Verify AI-generated code manually.
  * Ensure compatibility with specified Rust/Iced versions.

* AI-generated documentation:

  * Review rigorously for accuracy.
  * Edit for clarity and conciseness.

---

## 🔍 Post-Implementation Review

Upon completion of major features or phases:

* Perform manual code review for quality assurance.
* Validate adherence to project coding standards and guidelines.
* Summarize and document overall progress and any lessons learned in `README.md`.

---

## 🚨 Tooling & Dependencies (Do Not Deviate)

* Rust Nightly **1.89**
* Iced **0.13.1**
* Notify **5.0** (optional)
* Image **0.24**
* wgpu **0.12** (optional)

---

## 📅 Agent Activity Logging

Maintain explicit logs in `ROADMAP.md` and `README.md` after each development cycle:

```markdown
## 📝 AI Activity Log

- **[YYYY-MM-DD]** Implemented `[feature]` successfully.
- **[YYYY-MM-DD]** Fixed `[issue description]`.
- **[YYYY-MM-DD]** Updated documentation `[specific files]`.
```

---

🎯 **Follow these guidelines rigorously to maintain clarity, build stability, and effective iteration.** 🎯

