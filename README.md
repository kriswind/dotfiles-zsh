# My Zsh Configuration

Welcome to my Zsh configuration repository! This repository contains my personal Zsh setup, complete with plugins, themes, and custom functions to enhance productivity and aesthetics. This setup is designed for **Arch Linux** but can be adapted for other systems as well.

---

## Features
- **Powerlevel10k** for a beautiful and fast prompt.
- **Autosuggestions** for command-line efficiency.
- **Syntax Highlighting** to avoid errors and improve readability.
- Predefined **aliases** for common commands.
- Custom **functions**, such as navigating to project roots.
- Support for **Oh My Zsh** and **Arch-specific configurations**.

---

## Installation

### Prerequisites
- **Zsh** installed as your shell.
- Basic knowledge of terminal commands.

### Step 1: Clone the Repository
```bash
git clone https://github.com/kriswind/dotfiles-zsh.git ~/.zsh
```

### Step 2: Install Zsh and Make It Default (Arch Linux)
```bash
sudo pacman -S zsh
chsh -s $(which zsh)
```

### Step 3: Install Required Plugins
Run the following commands to install the required plugins.

#### 1. **Powerlevel10k**
```bash
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
```

#### 2. **zsh-autosuggestions**
```bash
sudo pacman -S zsh-autosuggestions
```

#### 3. **zsh-syntax-highlighting**
```bash
sudo pacman -S zsh-syntax-highlighting
```

#### 4. **Oh My Zsh** (Optional)
Oh My Zsh is not required, but it can provide additional tools and flexibility.
```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

### Step 4: Link `.zshrc`
Create a symbolic link to your home directory:
```bash
ln -sf ~/.zsh/.zshrc ~/.zshrc
```

### Step 5: Source Configuration
Reload the Zsh configuration:
```bash
source ~/.zshrc
```

---

## Customization

- **Modify Aliases**: Edit aliases in `.zshrc` to suit your workflow.
- **Change Theme**: Customize your Powerlevel10k prompt by running `p10k configure` or editing `~/.p10k.zsh`.
- **Add Plugins**: Additional plugins can be added by sourcing them in `.zshrc`.

---

## Troubleshooting

### Syntax Highlighting Issues
Ensure the plugin is sourced at the **end** of the `.zshrc` file:
```bash
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
```

### Autosuggestions Not Working
Ensure the plugin is installed correctly:
```bash
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
```

---

## Future Enhancements
- **Support for additional OS configurations.**
- **Add more aliases and functions.**

---

## License
This repository is licensed under the MIT License.

---

## Contributions
Feel free to fork and submit pull requests to improve or customize the configuration! 🎉
