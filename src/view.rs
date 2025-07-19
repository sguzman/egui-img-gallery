use iced::widget::{Button, Column, Image, Row, Text};
use iced::Length;

pub fn create_collage_viewer<Message: Clone + 'static>(
    grid: &[String],
    grid_size: usize,
    inc_msg: Message,
    dec_msg: Message,
) -> Column<'static, Message> {
    let mut column = Column::new().spacing(10);

    let controls = Row::new()
        .spacing(5)
        .push(Button::new(Text::new("-"))
            .on_press(dec_msg))
        .push(Button::new(Text::new("+"))
            .on_press(inc_msg));

    column = column.push(controls);
    for row_index in 0..grid_size {
        let mut row = Row::new().spacing(5);
        for col_index in 0..grid_size {
            if let Some(path) = grid.get(row_index * grid_size + col_index) {
                row = row.push(Image::new(path).width(Length::Fill).height(Length::Fill));
            }
        }
        column = column.push(row);
    }
    column
}
