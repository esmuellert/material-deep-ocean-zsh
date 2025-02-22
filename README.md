# Material Deep Ocean ZSH Theme

A clean and elegant ZSH theme inspired by the Material Deep Ocean color scheme.

## Features

- Git status integration
- Directory path display
- Command execution time
- Clean and minimal prompt design
- Syntax highlighting
- Auto-suggestions

## Installation

### Quick Installation (One Command)

```bash
curl -fsSL https://raw.githubusercontent.com/esmuellert/material-deep-ocean-zsh/main/install_zsh.sh -o /tmp/install_zsh.sh && chmod +x /tmp/install_zsh.sh && /tmp/install_zsh.sh
```

### Automatic Installation (Recommended)

1. Download and run the installation script:
```bash
curl -fsSL https://raw.githubusercontent.com/esmuellert/material-deep-ocean-zsh/main/install_zsh.sh | bash
```

The script will:
- Install ZSH if not already installed
- Install Oh My ZSH
- Install required plugins (zsh-syntax-highlighting, zsh-autosuggestions)
- Set up the Material Deep Ocean theme
- Configure ZSH as your default shell

### Manual Installation

1. Install ZSH and Oh My ZSH
2. Clone this repository:
```bash
git clone https://github.com/esmuellert/material-deep-ocean-zsh.git
```

3. Install required plugins:
```bash
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
```

4. Copy the theme and configuration:
```bash
cp material-deep-ocean-zsh/material_deep_ocean.zsh-theme ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/
cp material-deep-ocean-zsh/.zshrc ~/.zshrc
```

## Customization

You can customize the theme by editing your `~/.zshrc` file. The default configuration includes:
- Custom aliases
- Plugin configurations
- Theme settings

## Requirements

- ZSH shell
- Oh My ZSH
- Git (for installation and theme features)
- A terminal that supports 256 colors

## License

MIT License

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.
