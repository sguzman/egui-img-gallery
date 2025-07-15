// main.rs
mod animations;
mod events;
mod folder_monitor;
mod image_handling;
mod model;
mod view;

use iced::{Application, Settings};

fn main() {
    let settings = Settings::default();
    MyApp::run(settings);
}

struct MyApp {
    model: model::Model,
    // Add more state if needed
}

impl Application for MyApp {
    // Handle initialization, updating, and view
}
