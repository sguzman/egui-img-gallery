use iced::widget::{Column, Image, Row};
use iced::Length;

pub fn create_collage_viewer<Message: Clone + 'static>(grid: &[String], grid_size: usize) -> Column<'static, Message> {
    let mut column = Column::new();
    for row_index in 0..grid_size {
        let mut row = Row::new();
        for col_index in 0..grid_size {
            if let Some(path) = grid.get(row_index * grid_size + col_index) {
                row = row.push(Image::new(path).width(Length::Fill).height(Length::Fill));
            }
        }
        column = column.push(row);
    }
    column
}
