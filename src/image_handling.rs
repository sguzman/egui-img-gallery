use image::{open, DynamicImage};

pub fn load_image(path: &str) -> DynamicImage {
    open(path).unwrap()
}

pub fn resize_image(image: &DynamicImage, width: u32, height: u32) -> DynamicImage {
    image.resize(width, height, image::imageops::FilterType::Lanczos3)
}
