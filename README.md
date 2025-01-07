# 🚀 My Tmux Configuration

## 🛠️ Installation

You can install this tmux configuration easily with the following command:

```bash
bash -c "$(wget https://raw.githubusercontent.com/herschel21/tmux-config/main/install.sh -O -)"
```

This command downloads and runs the installation script, which will:
- Install tmux if not already present
- Back up your existing tmux configuration
- Install TPM (Tmux Plugin Manager)
- Set up the new configuration
- Install all required plugins

## 🗑️ Removal

To remove this tmux configuration and restore your backup:

```bash
bash -c "$(wget https://raw.githubusercontent.com/herschel21/tmux-config/main/uninstall.sh -O -)"
```

## 🚀 Usage

After installation, simply run `tmux` to start a new session with the configuration.

## ⌨️ Keymaps

### General Controls

| Keymap | Action |
|--------|--------|
| `C-s` | Prefix key (alternative to default `C-b`) |
| `prefix` + `r` | Reload tmux configuration |
| `prefix` + `C-c` | Create new session |
| `prefix` + `C-f` | Find session |
| `prefix` + `m` | Toggle mouse mode |

### Window Management

| Keymap | Action |
|--------|--------|
| `prefix` + `-` | Split window vertically |
| `prefix` + `_` | Split window horizontally |
| `prefix` + `Tab` | Switch to last active window |
| `prefix` + `C-h` | Previous window |
| `prefix` + `C-l` | Next window |

### Pane Navigation

| Keymap | Action |
|--------|--------|
| `prefix` + `j` | Select pane below |
| `prefix` + `k` | Select pane above |
| `prefix` + `+` | Maximize current pane |

### Pane Resizing

| Keymap | Action |
|--------|--------|
| `prefix` + `H` | Resize pane left |
| `prefix` + `J` | Resize pane down |
| `prefix` + `K` | Resize pane up |
| `prefix` + `L` | Resize pane right |

### Copy Mode

| Keymap | Action |
|--------|--------|
| `prefix` + `Enter` | Enter copy mode |
| `v` | Begin selection |
| `C-v` | Rectangle selection |

## 🎨 Features

- 256 color support
- Mouse mode enabled
- Vi key bindings in copy mode
- Custom status bar with tmux2k theme
- Increased history limit (5000 lines)
- UTF-8 support
- Fast command sequences with reduced escape time
- Status bar with git, CPU, RAM, battery, network, and time information

## 🔌 Plugins

The configuration uses TPM (Tmux Plugin Manager) with the following plugins:
- tmux-plugins/tpm (Plugin Manager)
- 2kabhishek/tmux2k (Theme and Status Line)

## ⚙️ Theme Configuration

The configuration uses the tmux2k theme with:
- Theme: duo
- Foreground color: #1688f0
- Background color: #000000

Status bar shows:
- Left: git, CPU, RAM, current directory
- Right: battery, network, time, window

## 🔧 Customization

You can customize the configuration by editing `~/.tmux.conf`. Common customizations:

```bash
# Change theme colors
set -g @tmux2k-duo-fg "#your-color"
set -g @tmux2k-duo-bg "#your-color"

# Modify status bar plugins
set -g @tmux2k-left-plugins "your-plugins"
set -g @tmux2k-right-plugins "your-plugins"

# Change time format
set -g @tmux2k-time-format "your-format"
```

---

