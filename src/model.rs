use std::fs;

pub struct Model {
    pub images: Vec<String>,
    pub collage_grid: Vec<String>,
    pub grid_size: usize,
}

impl Model {
    pub fn new(grid_size: usize) -> Self {
        let images: Vec<String> = fs::read_dir("assets")
            .unwrap()
            .filter_map(|e| e.ok())
            .filter(|e| e.path().is_file())
            .map(|e| e.path().display().to_string())
            .collect();

        let mut model = Self {
            images,
            collage_grid: Vec::new(),
            grid_size,
        };
        model.create_collage(grid_size);
        model
    }

    pub fn shuffle_images(&mut self) {
        // Placeholder for shuffle logic
    }

    pub fn create_collage(&mut self, grid_size: usize) {
        let needed = grid_size * grid_size;
        let mut iter = self.images.iter().cycle();
        self.collage_grid = (0..needed)
            .filter_map(|_| iter.next().cloned())
            .collect();
    }
}
