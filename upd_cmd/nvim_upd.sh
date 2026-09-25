bash <<'EOF'
set -euo pipefail

case "$(uname -m)" in
  x86_64) arch=x86_64 ;;
  aarch64|arm64) arch=arm64 ;;
  *) echo "Arquitectura no compatible con este comando"; exit 1 ;;
esac

mkdir -p "$HOME/.local/bin" "$HOME/.local/opt"
nvim_tmp=$(mktemp -d "$HOME/.local/opt/nvim-update.XXXXXX")
trap 'rm -rf "$nvim_tmp"' EXIT

curl -fL --retry 3 \
  "https://github.com/neovim/neovim/releases/latest/download/nvim-linux-${arch}.tar.gz" \
  -o "$nvim_tmp/nvim.tar.gz"

tar -xzf "$nvim_tmp/nvim.tar.gz" -C "$nvim_tmp"
"$nvim_tmp/nvim-linux-${arch}/bin/nvim" --version

nvim_dest="$HOME/.local/opt/nvim"
if [ -e "$nvim_dest" ] || [ -L "$nvim_dest" ]; then
  mv "$nvim_dest" "${nvim_dest}.backup-$(date +%s)"
fi

mv "$nvim_tmp/nvim-linux-${arch}" "$nvim_dest"
ln -sfnT "$nvim_dest/bin/nvim" "$HOME/.local/bin/nvim"

rc_file="${ZDOTDIR:-$HOME}/.zshrc"
path_line='export PATH="$HOME/.local/bin:$PATH"'
touch "$rc_file"
grep -qxF "$path_line" "$rc_file" ||
  printf '\n%s\n' "$path_line" >> "$rc_file"

echo "Neovim instalado. Abre una nueva terminal."
EOF
