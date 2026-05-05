# Karabiner-Elements Configuration

Ergonomics-focused Karabiner-Elements configuration to reduce left thumb strain by moving app-switching to a **Hyper key** on the right thumb.

## Overview

<<<<<<< HEAD

- **Right Command** on all keyboards (except ZSA Voyager) is mapped to a **Hyper key** (`Cmd + Ctrl + Opt + Shift`)
- **Hyper + Letter** combinations switch to or open apps
- **Hyper + Letter** when app is already focused cycles through that app's windows (replaces painful `Cmd + \``)
- # Works alongside the ZSA Voyager split keyboard (hyper already configured in firmware, so Right Command is left untouched)
- **Right Command** on Apple keyboards (MacBook internal & external Touch ID keyboard) is mapped to a **Hyper key** (`Cmd + Ctrl + Opt + Shift`)
- **Hyper + Letter** combinations switch to or open apps
- Works alongside the ZSA Voyager split keyboard (hyper already configured in firmware)
  > > > > > > > 2b0152131204a6f7f2b1f083834fea476d8558bf
- Version controlled in Git for easy sync across work laptops

## Hyper Key Mappings

| Shortcut | Action |
| -------- | ------ |

<<<<<<< HEAD
| `Hyper + S` | Open / Switch to **Slack** (cycle windows if already focused) |
| `Hyper + C` | Open / Switch to **Visual Studio Code** (cycle windows if already focused) |
| `Hyper + B` | Open / Switch to **Browser** (Safari) (cycle windows if already focused) |
| `Hyper + T` | Open / Switch to **Terminal** (cycle windows if already focused) |
| `Hyper + F` | Open / Switch to **Finder** (cycle windows if already focused) |

> **Note:** Edit `karabiner.json` to change the browser or add more app shortcuts.

## Window Cycling

When an app is already the frontmost application, pressing its Hyper shortcut again sends `Cmd + \`` to cycle to the next window of that app. This replaces the default macOS window cycling shortcut, which is ergonomically awkward.

For example:

1. `Hyper + C` → brings VS Code to the front
2. `Hyper + C` again (while VS Code is focused) → cycles to the next VS Code window
3. Keep pressing `Hyper + C` to keep cycling through all VS Code windows

=======
| `Hyper + S` | Open / Switch to **Slack** |
| `Hyper + C` | Open / Switch to **Visual Studio Code** |
| `Hyper + B` | Open / Switch to **Browser** (Safari) |
| `Hyper + T` | Open / Switch to **Terminal** |
| `Hyper + F` | Open / Switch to **Finder** |

> **Note:** Edit `karabiner.json` to change the browser or add more app shortcuts.

> > > > > > > 2b0152131204a6f7f2b1f083834fea476d8558bf

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

Edit `karabiner.json` and replace `'Safari'` with your preferred browser, and update the bundle identifier in both `frontmost_application_if` and `frontmost_application_unless` conditions:

- Chrome: bundle ID `com.google.Chrome`, app name `'Google Chrome'`
- Firefox: bundle ID `org.mozilla.firefox`, app name `'Firefox'`
- Arc: bundle ID `company.thebrowser.Browser`, app name `'Arc'`
- Brave: bundle ID `com.brave.Browser`, app name `'Brave Browser'`

### Add More App Shortcuts

Copy an existing rule block in `karabiner.json` and change:

- `key_code`: the letter key
- `shell_command`: the `open -a 'App Name'` command
- `bundle_identifiers`: the app's bundle ID (find with `osascript -e 'id of app "App Name"'`)

### Exclude Additional Keyboards

If you have other keyboards that should keep their Right Command behavior, add them to the `device_unless` condition in the "Right Command → Hyper Key" rule. Find the keyboard's vendor ID in **Karabiner-Elements** → **Settings** → **Devices**.

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
  <<<<<<< HEAD
- # **Built-in keyboard not working?** This config uses `device_unless` to exclude the ZSA Voyager. If your built-in keyboard still doesn't work, check its vendor ID in Karabiner-Elements → Devices.
  > > > > > > > 2b0152131204a6f7f2b1f083834fea476d8558bf
