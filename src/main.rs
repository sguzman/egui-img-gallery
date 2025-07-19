mod model;
mod view;

use env_logger::Env;
use iced::{Element, application, time};
use log::info;
use model::Model;
use view::create_collage_viewer;

#[derive(Debug, Clone)]
enum Message {
    IncreaseGrid,
    DecreaseGrid,
    IncreaseCell,
    DecreaseCell,
    ToggleTheme,
    Shuffle,
    Refresh,
    Tick,
}

struct State {
    model: Model,
    theme: iced::Theme,
}

impl Default for State {
    fn default() -> Self {
        const GRID: usize = 2;
        Self {
            model: Model::new(GRID),
            theme: iced::Theme::Dark,
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
        Message::IncreaseCell => {
            state.model.increase_cell_size();
        }
        Message::DecreaseCell => {
            state.model.decrease_cell_size();
        }
        Message::ToggleTheme => {
            state.theme = match state.theme {
                iced::Theme::Dark => iced::Theme::Light,
                _ => iced::Theme::Dark,
            };
        }
        Message::Shuffle => {
            state.model.shuffle_images();
        }
        Message::Refresh => {
            state.model.force_refresh();
        }
        Message::Tick => {
            state.model.refresh_due_images();
        }
    }
}

fn view(state: &State) -> Element<Message> {
    create_collage_viewer(
        &state.model.collage_grid,
        state.model.grid_size,
        state.model.cell_size,
        Message::IncreaseGrid,
        Message::DecreaseGrid,
        Message::IncreaseCell,
        Message::DecreaseCell,
        Message::ToggleTheme,
        Message::Shuffle,
        Message::Refresh,
    )
    .into()
}

fn main() -> iced::Result {
    env_logger::Builder::from_env(Env::default().default_filter_or("info")).init();
    info!("Launching Iced Gallery App");
    application("Iced Gallery App", update, view)
        .theme(|state: &State| state.theme.clone())
        .subscription(|state: &State| time::every(state.model.refresh_rate).map(|_| Message::Tick))
        .run()
}
