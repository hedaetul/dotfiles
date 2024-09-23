# Alacritty Themes

A collection of colorschemes for easy configuration of the [Alacritty terminal emulator](https://github.com/alacritty/alacritty).

## Installation

### Imports

Clone the repository, or download the theme of your choice:

```sh
# We use Alacritty's default Linux config directory as our storage location here.
mkdir -p ~/.config/alacritty/themes
git clone https://github.com/alacritty/alacritty-theme ~/.config/alacritty/themes
```

Add an import to your `alacritty.toml` (Replace `{theme}` with your desired colorscheme):

```toml
import = [
    "~/.config/alacritty/themes/themes/{theme}.toml"
]
```

### Manual

To manually include a colorscheme in an existing `alacritty.toml`, you just need to copy the entire content of the theme into the root level of your configuration file.

## Color Schemes

| Name | Colors |
|------|--------|
| **_wombat_**<br>[source](https://github.com/djoyner/iTerm2-wombat) | ![wombat](images/wombat.png) |
| **_xterm_** | ![xterm](images/xterm.png) |
| **_zenburn_**<br>[source](https://github.com/jnurmine/Zenburn) | ![zenburn](images/zenburn.png) |

## Image Styling Features

### Default Image

![default](images/default.png)

### Image with Border

![border](images/border.png){: style="border: 2px solid black;" }

### Image with Shadow

![shadow](images/shadow.png){: style="box-shadow: 5px 5px 15px rgba(0,0,0,0.3);" }

### Image with Rounded Corners

![rounded](images/rounded.png){: style="border-radius: 10px;" }

### Image with Custom Size

![custom-size](images/custom-size.png){: style="width: 200px; height: auto;" }

## Contributing

Bug reports and pull requests are welcome on GitHub at the [alacritty-theme](https://github.com/alacritty/alacritty-theme) repository.

To add a new theme, just create a Pull Request with the following changes:

- Add your theme to the `themes` directory with the `{theme}.toml` file format
- Create a screenshot of your theme using the [`print_colors.sh`](./print_colors.sh) script
- Add the screenshot to the `images` directory with the `{theme}.png` file format
- Add your theme to the `README.md`, following alphabetical ordering

## Maintainers

- **indrajit** - *Author* - [eendroroy](https://github.com/eendroroy)
- **Christian Dürr** - *Maintainer* - [chrisduerr](https://github.com/chrisduerr)

## License

The project is available as open source under the terms of the [Apache License, Version 2.0](LICENSE)
