use iced::Length;
use iced::widget::{Button, Column, Image, Row, Text, Container, container};

pub fn create_collage_viewer<Message: Clone + 'static>(
    grid: &[String],
    grid_size: usize,
    cell_size: u16,
    inc_msg: Message,
    dec_msg: Message,
    inc_cell_msg: Message,
    dec_cell_msg: Message,
    theme_toggle: Message,
    shuffle_msg: Message,
    refresh_msg: Message,
) -> Column<'static, Message> {
    let mut column = Column::new().spacing(10);

    let controls = Row::new()
        .spacing(5)
        .push(Button::new(Text::new("-")).on_press(dec_msg))
        .push(Button::new(Text::new("+")).on_press(inc_msg))
        .push(Button::new(Text::new("Cell -")).on_press(dec_cell_msg))
        .push(Button::new(Text::new("Cell +")).on_press(inc_cell_msg))
        .push(Button::new(Text::new("Theme")).on_press(theme_toggle))
        .push(Button::new(Text::new("Shuffle")).on_press(shuffle_msg))
        .push(Button::new(Text::new("Refresh")).on_press(refresh_msg));

    column = column.push(controls);
    for row_index in 0..grid_size {
        let mut row = Row::new().spacing(5);
        for col_index in 0..grid_size {
            if let Some(path) = grid.get(row_index * grid_size + col_index) {
                let img = Image::new(path)
                    .width(Length::Fill)
                    .height(Length::Fill);
                row = row.push(
                    Container::new(img)
                        .padding(5)
                        .style(container::bordered_box)
                        .width(Length::Fixed(cell_size as f32))
                        .height(Length::Fixed(cell_size as f32)),
                );
            }
        }
        column = column.push(row);
    }
    column
}
