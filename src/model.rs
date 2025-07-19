use rand::seq::SliceRandom;
use rand::thread_rng;
use std::{
    fs,
    time::{Duration, Instant},
};

pub struct Model {
    pub images: Vec<String>,
    pub collage_grid: Vec<String>,
    pub grid_size: usize,
    pub cell_size: u16,
    pub refresh_rate: Duration,
    current_indices: Vec<usize>,
    next_refresh: Vec<Instant>,
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
            cell_size: 150,
            refresh_rate: Duration::from_secs(5),
            current_indices: Vec::new(),
            next_refresh: Vec::new(),
        };
        model.create_collage(grid_size);
        model
    }

    pub fn shuffle_images(&mut self) {
        let mut rng = thread_rng();
        let mut combined: Vec<_> = self
            .collage_grid
            .iter()
            .cloned()
            .zip(self.current_indices.iter().cloned())
            .zip(self.next_refresh.iter().cloned())
            .map(|((p, i), t)| (p, i, t))
            .collect();
        combined.shuffle(&mut rng);
        self.collage_grid = combined.iter().map(|(p, _, _)| p.clone()).collect();
        self.current_indices = combined.iter().map(|(_, i, _)| *i).collect();
        self.next_refresh = combined.iter().map(|(_, _, t)| *t).collect();
    }

    pub fn create_collage(&mut self, grid_size: usize) {
        let needed = grid_size * grid_size;
        self.collage_grid.clear();
        self.current_indices.clear();
        self.next_refresh.clear();
        let mut idx_iter = (0..self.images.len()).cycle();
        for _ in 0..needed {
            let idx = idx_iter.next().unwrap();
            self.current_indices.push(idx);
            self.collage_grid.push(self.images[idx].clone());
            // stagger refresh to avoid simultaneous updates
            self.next_refresh.push(Instant::now() + self.refresh_rate);
        }
    }

    pub fn update_grid_size(&mut self, new_size: usize) {
        self.grid_size = new_size;
        self.create_collage(new_size);
    }

    pub fn refresh_due_images(&mut self) {
        let now = Instant::now();
        for (i, next) in self.next_refresh.iter_mut().enumerate() {
            if now >= *next {
                self.current_indices[i] = (self.current_indices[i] + 1) % self.images.len();
                self.collage_grid[i] = self.images[self.current_indices[i]].clone();
                *next = now + self.refresh_rate;
            }
        }
    }

    pub fn force_refresh(&mut self) {
        self.create_collage(self.grid_size);
    }

    pub fn increase_cell_size(&mut self) {
        self.cell_size += 10;
    }

    pub fn decrease_cell_size(&mut self) {
        if self.cell_size > 20 {
            self.cell_size -= 10;
        }
    }
}
