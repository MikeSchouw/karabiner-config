# Karabiner-Elements Configuration

Ergonomics-focused Karabiner-Elements configuration to reduce left thumb strain by moving app-switching to a **Hyper key** on the right thumb.

## Overview

- **Right Command** on Apple keyboards (MacBook internal & external Touch ID keyboard) is mapped to a **Hyper key** (`Cmd + Ctrl + Opt + Shift`)
- **Hyper + Letter** combinations switch to or open apps
- Works alongside the ZSA Voyager split keyboard (hyper already configured in firmware)
- Version controlled in Git for easy sync across work laptops

## Hyper Key Mappings

| Shortcut | Action |
|----------|--------|
| `Hyper + S` | Open / Switch to **Slack** |
| `Hyper + C` | Open / Switch to **Visual Studio Code** |
| `Hyper + B` | Open / Switch to **Browser** (Safari) |
| `Hyper + T` | Open / Switch to **Terminal** |
| `Hyper + F` | Open / Switch to **Finder** |

> **Note:** Edit `karabiner.json` to change the browser or add more app shortcuts.

## Prerequisites

- macOS
- [Karabiner-Elements](https://karabiner-elements.pqrs.org/) installed

Install via Homebrew:
```bash
brew install --cask karabiner-elements
```

## Installation

### First Time Setup

```bash
cd ~/karabiner-config
./install.sh
```

This will:
1. Back up any existing `karabiner.json`
2. Symlink this repository's config to `~/.config/karabiner/karabiner.json`

### On a New Laptop

1. Clone this repository:
```bash
git clone <your-repo-url> ~/karabiner-config
cd ~/karabiner-config
```

2. Install Karabiner-Elements (see Prerequisites)

3. Run the install script:
```bash
./install.sh
```

4. Open **Karabiner-Elements** → **Settings** → **Profiles** and ensure the "Default" profile is active.

## Customization

### Change the Browser

Edit `karabiner.json` and replace `'Safari'` with your preferred browser:
- Chrome: `'Google Chrome'`
- Firefox: `'Firefox'`
- Arc: `'Arc'`
- Brave: `'Brave Browser'`

### Add More App Shortcuts

Copy an existing manipulator block in the `Hyper + Letter → App Switching` rule and change:
- `key_code`: the letter key
- `shell_command`: the `open -a 'App Name'` command

### Exclude Internal MacBook Keyboard

If you want the right Command → Hyper mapping **only** on the external Touch ID keyboard (not the MacBook's internal keyboard), edit the `device_if` condition in `karabiner.json` to include a specific `product_id`.

Find your keyboard's product ID in **Karabiner-Elements** → **Settings** → **Devices**, then add it:

```json
{
  "type": "device_if",
  "identifiers": [
    {
      "vendor_id": 1452,
      "product_id": 12345,
      "is_keyboard": true
    }
  ]
}
```

## Syncing Changes

After making changes to `karabiner.json`:

```bash
cd ~/karabiner-config
git add karabiner.json
git commit -m "Update app shortcuts"
git push
```

Karabiner-Elements automatically reloads the config when the file changes (no restart needed).

## Troubleshooting

- **Config not loading?** Check Karabiner-Elements → **Log** for JSON syntax errors.
- **App not opening?** Verify the exact app name with `ls /Applications`.
- **Right Command still acting as Command?** Check that the correct profile is selected in Karabiner-Elements settings.
- **ZSA Voyager hyper not working?** Ensure the Voyager's firmware hyper sends all four modifiers (`Cmd + Ctrl + Opt + Shift`).
