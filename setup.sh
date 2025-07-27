#!/bin/bash

echo "🔧 Starting setup..."

# 1. Check or create .bashrc and .zshrc
[ -f ~/.bashrc ] || touch ~/.bashrc
[ -f ~/.zshrc ] || touch ~/.zshrc

# 2. Install neofetch if not already installed
if ! command -v neofetch &>/dev/null; then
    echo "📦 Installing neofetch..."
    sudo apt update && sudo apt install -y neofetch
else
    echo "✅ Neofetch is already installed."
fi

# 3. Code to inject into both .bashrc and .zshrc
injection='powershell.exe -windowstyle hidden -c "(New-Object Media.SoundPlayer '\''C:\\Users\\dbibi\\Music\\Ghost.wav'\'').PlaySync()" &

sleep 2

# Dramatic terminal effect
echo -n "💀 "
for c in I\ \ S E E\ \ Y O U; do
    echo -n "$c"
    sleep 0.2
done
echo -e "\n"'

# 4. Inject code if not already present
for file in ~/.bashrc ~/.zshrc; do
    if ! grep -q "I SEE YOU" "$file"; then
        echo "💉 Injecting dramatic script into $file"
        echo -e "\n$injection" >> "$file"
    else
        echo "🔁 Script already exists in $file"
    fi
done

# 5. Detect current Windows username
WIN_USER=$(cmd.exe /C "echo %USERNAME%" 2>/dev/null | tr -d '\r')
MUSIC_DIR="/mnt/c/Users/$WIN_USER/Music"

# 6. Create Music directory if it doesn't exist
if [ ! -d "$MUSIC_DIR" ]; then
    echo "📁 Creating Music directory at $MUSIC_DIR"
    mkdir -p "$MUSIC_DIR"
else
    echo "🎵 Music directory already exists at $MUSIC_DIR"
fi

# 7. Download Ghost.wav from your GitHub repo
echo "🌐 Downloading Ghost.wav..."
wget -O "$MUSIC_DIR/Ghost.wav" "https://github.com/Ossama1999-DEV/HackEffect/blob/main/Ghost.wav?raw=true" || {
    echo "❌ Failed to download Ghost.wav. Please check your internet connection or the URL."
    exit 1
}

# 8. Final instructions for the user
clear
echo "✅ Setup complete!"
echo "-----------------------------"
echo "🎬 What just happened:"
echo "1. Neofetch installed (if needed)."
echo "2. .bashrc and .zshrc were modified to play a sound and display a message."
echo "3. Ghost.wav was downloaded to your Windows Music folder."
echo
echo "👉 To activate the effect:"
echo "   1. Type 'exit' to leave WSL."
echo "   2. Reopen WSL from PowerShell."
echo "   3. Enjoy the surprise 😈"
echo "-----------------------------"
echo "🔚 End of setup script."