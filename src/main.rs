mod model;
mod view;

use env_logger::Env;
use log::info;
use iced::{application, time, Element};
use model::Model;
use view::create_collage_viewer;

#[derive(Debug, Clone)]
enum Message {
    IncreaseGrid,
    DecreaseGrid,
    Tick,
}

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

fn update(state: &mut State, message: Message) {
    match message {
        Message::IncreaseGrid => {
            state.model.update_grid_size(state.model.grid_size + 1);
        }
        Message::DecreaseGrid => {
            if state.model.grid_size > 1 {
                state.model.update_grid_size(state.model.grid_size - 1);
            }
        }
        Message::Tick => {
            state.model.refresh();
        }
    }
}

fn view(state: &State) -> Element<Message> {
    create_collage_viewer(
        &state.model.collage_grid,
        state.model.grid_size,
        Message::IncreaseGrid,
        Message::DecreaseGrid,
    )
    .into()
}

fn main() -> iced::Result {
    env_logger::Builder::from_env(Env::default().default_filter_or("info")).init();
    info!("Launching Iced Gallery App");
    application("Iced Gallery App", update, view)
        .subscription(|state: &State| {
            time::every(state.model.refresh_rate).map(|_| Message::Tick)
        })
        .run()
}
