use zellij_tile::prelude::{InputMode, Palette, PaletteColor, ThemeHue};

pub const LIGHTER_GRAY: PaletteColor = PaletteColor::Rgb((146, 131, 116)); // Gruvbox light gray
pub const DARKER_GRAY: PaletteColor = PaletteColor::Rgb((40, 40, 40)); // Gruvbox dark gray

pub struct ModeColor {
    pub fg: PaletteColor,
    pub bg: PaletteColor,
}

impl ModeColor {
    pub fn new(mode: InputMode, palette: Palette) -> Self {
        let fg = match palette.theme_hue {
            ThemeHue::Dark => PaletteColor::Rgb((235, 219, 178)), // Gruvbox fg (light brown)
            ThemeHue::Light => PaletteColor::Rgb((251, 241, 199)), // Gruvbox white
        };

        let bg = match mode {
            InputMode::Locked => PaletteColor::Rgb((131, 165, 152)), // Gruvbox cyan
            InputMode::Normal => PaletteColor::Rgb((152, 151, 26)),  // Gruvbox green
            _ => PaletteColor::Rgb((214, 93, 14)),                   // Gruvbox orange
        };

        Self { fg, bg }
    }
}
