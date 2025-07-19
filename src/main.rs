mod model;
mod view;

use env_logger::Env;
use log::info;
use iced::Element;
use model::Model;
use view::create_collage_viewer;

#[derive(Debug, Clone)]
enum Message {}

struct State {
    model: Model,
}

impl Default for State {
    fn default() -> Self {
        const GRID: usize = 2;
        Self {
            model: Model::new(GRID),
        }
    }
}

fn update(_state: &mut State, _message: Message) {
    // No-op for now
}

fn view(state: &State) -> Element<Message> {
    create_collage_viewer(&state.model.collage_grid, state.model.grid_size).into()
}

fn main() -> iced::Result {
    env_logger::Builder::from_env(Env::default().default_filter_or("info")).init();
    info!("Launching Iced Gallery App");
    iced::run("Iced Gallery App", update, view)
}
