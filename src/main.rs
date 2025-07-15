use iced::{Application, Command, Element, Settings};
use log::{info, debug};

// Setup logging for debugging
pub fn setup_logging() {
    env_logger::init();
}

// Struct to hold app state
pub struct MyApp {
    // App state variables here
}

impl MyApp {
    fn log_initialization() {
        info!("🚀 Initializing MyApp...");
    }

    fn log_update() {
        info!("🔄 App updated!");
    }
}

impl Application for MyApp {
    type Executor = iced::executor::Default;
    type Message = ();

    fn new(_flags: ()) -> (Self, Command<Self::Message>) {
        setup_logging();
        MyApp::log_initialization();
        info!("🚀 App Started!");
        (MyApp {}, Command::none())
    }

    fn update(&mut self, _message: Self::Message) -> Command<Self::Message> {
        MyApp::log_update();
        debug!("🔄 App state updated.");
        Command::none()
    }

    fn view(&mut self) -> Element<Self::Message> {
        info!("👀 Rendering view!");
        iced::widget::Text::new("Hello, Iced!").into()
    }
}

fn main() {
    MyApp::run(Settings::default()).unwrap();
    info!("✅ App finished execution!");
}

