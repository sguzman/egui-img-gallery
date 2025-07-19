use egui_img_gallery::model::Model;
use std::fs;

fn setup_assets() {
    let _ = fs::create_dir("assets");
    let _ = fs::write("assets/dummy.txt", "test");
}

#[test]
fn cell_size_updates() {
    setup_assets();
    let mut m = Model::new(2);
    let initial = m.cell_size;
    m.increase_cell_size();
    assert!(m.cell_size > initial);
    m.decrease_cell_size();
    assert_eq!(m.cell_size, initial);
}

#[test]
fn grid_size_updates() {
    setup_assets();
    let mut m = Model::new(2);
    m.update_grid_size(4);
    assert_eq!(m.grid_size, 4);
}
