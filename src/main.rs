use iced::{Application, Command, Element, Settings};

struct MyApp {
    // Application state
}

impl Application for MyApp {
    type Executor = iced::executor::Default;
    type Message = ();

    fn new(_flags: ()) -> (Self, Command<Self::Message>) {
        println!("🚀 App started!");
        (MyApp {}, Command::none())
    }

    fn update(&mut self, _message: Self::Message) -> Command<Self::Message> {
        println!("🔄 App updated!");
        Command::none()
    }

    fn view(&mut self) -> Element<Self::Message> {
        println!("👀 Rendering view!");
        iced::widget::Text::new("Hello, Iced!").into()
    }
}

fn main() {
    MyApp::run(Settings::default()).unwrap();
}
