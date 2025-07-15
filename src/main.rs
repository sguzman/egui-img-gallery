use log::{info, debug, error};
use iced::widget::{Column, Text};
use iced::{Command, Element};

pub fn setup_logging() {
    env_logger::init();
}

struct MyApp {
    // Application state
}

impl MyApp {
    fn log_initialization() {
        info!("🔧 Initializing MyApp...");
    }

    fn log_update() {
        info!("📝 Updating state...");
    }
}

impl iced::Application for MyApp {
    type Executor = iced::executor::Default;
    type Message = ();

    fn new(_flags: ()) -> (Self, Command<Self::Message>) {
        setup_logging();
        MyApp::log_initialization();
        info!("🚀 App Started! 🌟");
        (MyApp {}, Command::none())
    }

    fn update(&mut self, _message: Self::Message) -> Command<Self::Message> {
        MyApp::log_update();
        debug!("🔄 The app's state is being updated.");
        Command::none()
    }

    fn view(&mut self) -> Element<Self::Message> {
        info!("👀 Rendering the UI.");
        Column::new().push(Text::new("Hello, Iced!"))
            .into()
    }
}

fn main() {
    MyApp::run(Settings::default()).unwrap();
    info!("✅ App finished execution!");
}

