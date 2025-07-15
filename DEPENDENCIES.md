# 📦 DEPENDENCIES.md – Reference for AI-Assisted Development

This document lists all dependencies used in the **Picture Gallery App**, including their pinned versions, usage rationale, official documentation links, and any caveats. It is intended for developers and AI agents contributing incrementally to the project.

---

## 🧩 Core Crates

| Crate     | Version   | Description                                | Docs Link                                         | Notes |
|-----------|-----------|--------------------------------------------|--------------------------------------------------|-------|
| `iced`    | `0.13.1`  | GUI framework (UI layout, state, input)    | [docs.rs/iced/0.13.1](https://docs.rs/iced/0.13.1/iced/) | ❗ API is unstable. Stick strictly to 0.13.1 |
| `image`   | `0.24`    | Image loading, decoding, and manipulation  | [docs.rs/image/0.24.6](https://docs.rs/image/0.24.6/image/) | Use `DynamicImage` and `RgbaImage` |
| `notify`  | `5.0`     | Filesystem watcher (used for folder monitoring) | [docs.rs/notify/5.0.0](https://docs.rs/notify/5.0.0/notify/) | Optional: used for live folder updates |
| `wgpu`    | `0.12`    | Low-level GPU abstraction (optional rendering backend) | [docs.rs/wgpu/0.12.0](https://docs.rs/wgpu/0.12.0/wgpu/) | Optional: for future GPU-accelerated image rendering |

---

## 🛠 Development & Build Toolchain

| Tool      | Version      | Description                           | Docs Link |
|-----------|--------------|---------------------------------------|-----------|
| `rustup`  | Nightly 1.89 | Rust toolchain manager                | [rustup.rs](https://rustup.rs/) |
| `cargo`   | via 1.89     | Rust build tool & package manager     | [doc.rust-lang.org/cargo](https://doc.rust-lang.org/cargo/index.html) |

> ✅ Run `rustup default nightly-1.89` before development.  
> 🧪 Run `cargo build` after every change as per `AGENT.md`.

---

## 📁 Optional: Local Documentation

To generate and browse local copies of crate docs:

```sh
cargo doc --no-deps --workspace
````

Resulting HTML files will be found under:

```
target/doc/
```

To make these persistent for AI agents or offline reference, you can copy them into:

```
docs/
├── iced/
├── image/
├── notify/
├── wgpu/
```

If versioned in Git, update `.gitignore` accordingly.

---

## 🧠 Notes for AI Agents

* Only use the **exact versions** listed above.
* Prefer calling functions and types that are explicitly documented at the pinned version.
* Do **not** propose features from newer crate versions unless updating the `ROADMAP.md` and confirming build success.
* After referencing this file, consider logging the reference use in the commit message:

  ```
  docs: referenced iced 0.13.1 API for Button event handling
  ```

---

✅ This file supports AI coding, dependency management, and manual auditing. Keep it updated as dependencies evolve.

Would you like this written to a real `DEPENDENCIES.md` file in your project folder, or should I generate a script to auto-update it from your `Cargo.lock` in the future?

