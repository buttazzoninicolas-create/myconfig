#!/usr/bin/env bash

echo "🚀 Iniciando configuración del entorno..."

# 1. Crear directorios base
mkdir -p ~/.local/bin
mkdir -p ~/.local/share/fonts
mkdir -p ~/.config

# 2. Instalar bat (versión ejecutable sin necesidad de sudo)
echo "📦 Instalando bat..."
if ! command -v bat &> /dev/null; then
    curl -sL https://github.com/sharkdp/bat/releases/download/v0.24.0/bat-v0.24.0-x86_64-unknown-linux-musl.tar.gz | tar xz -C /tmp
    mv /tmp/bat-v0.24.0-x86_64-unknown-linux-musl/bat ~/.local/bin/
    echo "✅ bat instalado en ~/.local/bin/bat"
else
    echo "ℹ️ bat ya estaba instalado."
fi

# 3. Instalar JetBrainsMono Nerd Font
echo "🔤 Instalando JetBrainsMono Nerd Font..."
if [ ! -f ~/.local/share/fonts/JetBrainsMonoNerdFont-Regular.ttf ]; then
    curl -fLo "/tmp/JetBrainsMono.zip" https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.zip
    unzip -o /tmp/JetBrainsMono.zip -d ~/.local/share/fonts/ > /dev/null
    fc-cache -fv ~/.local/share/fonts > /dev/null
    echo "✅ Fuentes instaladas correctamente."
else
    echo "ℹ️ La fuente Nerd Font ya está instalada."
fi

# 4. Clonar / Actualizar configuración de Neovim
echo "⚙️ Configurando Neovim..."
if [ -d "$HOME/.config/nvim" ]; then
    echo "⚠️ La carpeta ~/.config/nvim ya existe. Actualizando..."
    cd ~/.config/nvim && git pull
else
    echo "📥 Clonando repositorio myconfig..."
    git clone git@github.com:buttazzoninicolas-create/myconfig.git ~/.config/nvim
fi

# 5. Configurar el ~/.zshrc (PATH y Aliases)
echo "📝 Actualizando ~/.zshrc..."
if ! grep -q 'export PATH="$HOME/.local/bin:$PATH"' ~/.zshrc 2>/dev/null; then
    echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.zshrc
fi

if ! grep -q 'alias cat="bat"' ~/.zshrc 2>/dev/null; then
    echo 'alias cat="bat"' >> ~/.zshrc
fi

echo "✨ ¡Configuración completada con éxito!"
echo "👉 Ejecuta: source ~/.zshrc para aplicar las variables a tu sesión actual."
