#!/usr/bin/env bash
set -e

echo "🚀 Starting setup for Picture Gallery App on Ubuntu..."

# --- System dependencies ---
echo "🔧 Installing required system packages..."
sudo apt update
sudo apt install -y \
    curl \
    libgtk-3-dev \
    libx11-dev \
    pkg-config \
    libxkbcommon-dev \
    libxcb-shape0-dev \
    libxcb-xfixes0-dev

# --- Rust toolchain setup ---
echo "🦀 Installing rustup and Rust Nightly (approx. 1.89)..."
if ! command -v rustup &> /dev/null; then
    curl --proto '=https' --tlsv1.2 https://sh.rustup.rs | sh -s -- -y
    export PATH="$HOME/.cargo/bin:$PATH"
fi

# Install the nightly version from right before Rust 1.89.0 stable
rustup install nightly-2024-05-22
rustup default nightly-2024-05-22

echo "📦 Verifying Rust version:"
rustc --version
cargo --version

# --- Optional: generate local docs ---
read -p "📄 Would you like to generate local crate documentation? (y/n): " gen_docs
if [[ "$gen_docs" =~ ^[Yy]$ ]]; then
    echo "📖 Building documentation..."
    cargo doc --no-deps --workspace
fi

# --- Create helper scripts ---
echo "🛠 Creating dev helper scripts..."

cat > run.sh <<'EOF'
#!/usr/bin/env bash
cargo run
EOF

cat > build.sh <<'EOF'
#!/usr/bin/env bash
cargo build
EOF

cat > doc.sh <<'EOF'
#!/usr/bin/env bash
cargo doc --no-deps --workspace --open
EOF

chmod +x run.sh build.sh doc.sh

echo "✅ Development environment is ready!"
echo "👉 Use ./build.sh to build, ./run.sh to run, and ./doc.sh to view docs."

