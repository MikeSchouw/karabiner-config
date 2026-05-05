#!/bin/bash
set -e

CONFIG_SOURCE="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/karabiner.json"
CONFIG_TARGET="$HOME/.config/karabiner/karabiner.json"

echo "🔧 Karabiner-Elements Config Installer"
echo "======================================"

if [ ! -d "/Applications/Karabiner-Elements.app" ]; then
    echo "⚠️  Karabiner-Elements not found in /Applications"
    echo "   Install it first: brew install --cask karabiner-elements"
    exit 1
fi

mkdir -p "$(dirname "$CONFIG_TARGET")"

if [ -f "$CONFIG_TARGET" ] && [ ! -L "$CONFIG_TARGET" ]; then
    BACKUP="$CONFIG_TARGET.backup.$(date +%Y%m%d%H%M%S)"
    echo "📦 Backing up existing config to: $BACKUP"
    cp "$CONFIG_TARGET" "$BACKUP"
fi

if [ -L "$CONFIG_TARGET" ] || [ -f "$CONFIG_TARGET" ]; then
    rm "$CONFIG_TARGET"
fi

echo "🔗 Linking config:"
echo "   Source: $CONFIG_SOURCE"
echo "   Target: $CONFIG_TARGET"
ln -s "$CONFIG_SOURCE" "$CONFIG_TARGET"

echo ""
echo "✅ Installation complete!"
echo ""
echo "Next steps:"
echo "1. Open Karabiner-Elements"
echo "2. Go to Settings → Profiles and ensure 'Default' is selected"
echo "3. The config auto-reloads. Test: press Right Command + S to open Slack"
echo "4. With Slack focused, press Right Command + S again to cycle Slack windows"
echo ""
