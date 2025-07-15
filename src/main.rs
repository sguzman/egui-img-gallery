use iced::widget::Text;
use iced::Element;

// No logging needed for minimal example

#[derive(Debug, Clone)]
enum Message {}

#[derive(Default)]
struct State;

fn update(_state: &mut State, _message: Message) {
    // No-op
}

fn view(_state: &State) -> Element<Message> {
    Text::new("Hello, Iced!").into()
}

fn main() -> iced::Result {
    iced::run("Iced Gallery App", update, view)
}
