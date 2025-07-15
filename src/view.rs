use iced::widget::{Column, Image, Row, Text};

pub fn create_image_viewer() -> Column {
    // Create layout for displaying images
    Column::new()
        .push(Image::new("path_to_image"))
        .push(Text::new("Image Slideshow"))
    // Add more UI components
}

pub fn create_collage_viewer(grid: Vec<String>, grid_size: usize) -> Column {
    // Create grid layout for collage
    let mut rows = Vec::new();
    for _ in 0..grid_size {
        let row = Row::new();
        rows.push(row);
    }
    Column::new().push(rows)
}
