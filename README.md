# macOS Terminal Customisation

My personal macOS terminal setup. Zsh + [Starship](https://starship.rs) prompt, autosuggestions, and syntax highlighting. Kept here so I can rebuild my whole setup on a new Mac in a couple of minutes instead of Googling to try and figure everything out again.

## What's in here

| File                    | Purpose                                                     |
| ----------------------- | ----------------------------------------------------------- |
| `.zshrc`                | Shell config: history, aliases, plugin loading, prompt init |
| `.config/starship.toml` | Starship prompt appearance/behaviour                        |
| `install.sh`            | One shot setup script for a fresh machine                   |

## Setting up on a new Mac

1. Install [Homebrew](https://brew.sh) if it's not already:
   ```bash
   /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
   ```
2. Clone this repo:
   ```bash
   git clone https://github.com/theosucksatcode/my-terminal.git ~/my-terminal
   cd ~/my-terminal
   ```
3. Run the installer:
   ```bash
   ./install.sh
   ```
   > If you get a `permission denied` error you will have to make the install script executable first by running `chmod +x install.sh` first, then try again.
4. Set the Terminal app's font to **Hack Nerd Font** so Starship icons render properly
5. Restart your terminal

_You can go the extra mile like I did and download a custom `.terminal` theme which can be dragged into Terminal > Settings > Profiles to accompany Hack Nerd Font also being set. I use Bluloco Dark for my terminal theme._

## Making changes

Because `.zshrc` and `starship.toml` are symlinked from this repo into your home folder, you can edit them either in `~/.zshrc` directly or in `~/my-terminal/.zshrc`, they're the same file. Just remember to:

```bash
cd ~/my-terminal
git add .
git commit -m "describe what changed"
git push
```

...whenever you want to save/sync a change.

## Notes to future self

- Starship prompt config full option reference can be found at https://starship.rs/config/
- Plugins are installed via Homebrew (not oh-my-zsh) to keep shell startup fast
- `zsh-syntax-highlighting` must be sourced **after** `zsh-autosuggestions` and Starship must be initialized **last** in `.zshrc`. Order is super important
