bash <<'EOF'
set -euo pipefail

font_dir="$HOME/.local/share/fonts/JetBrainsMono"
font_tmp=$(mktemp)
trap 'rm -f "$font_tmp"' EXIT

profile=$(gsettings get org.gnome.Terminal.ProfilesList default | tr -d "'")
test -n "$profile"

curl -fL --retry 3 \
  https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.tar.xz \
  -o "$font_tmp"

mkdir -p "$font_dir"
tar -xJf "$font_tmp" -C "$font_dir" --wildcards \
  '*JetBrainsMonoNerdFontMono-Regular.ttf' \
  '*JetBrainsMonoNerdFontMono-Bold.ttf' \
  '*JetBrainsMonoNerdFontMono-Italic.ttf' \
  '*JetBrainsMonoNerdFontMono-BoldItalic.ttf'

fc-cache -f "$font_dir"

schema="org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:${profile}/"
gsettings set "$schema" font 'JetBrainsMono Nerd Font Mono 12'
gsettings set "$schema" use-system-font false

echo "Fuente instalada y aplicada."
EOF
