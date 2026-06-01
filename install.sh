#!/bin/bash
# install.sh - Dotfiles setup script
# BoraAITA - Personal developer environment configuration

set -e

echo "🚀 Starting dotfiles installation..."
echo ""

# Git config
echo "📝 Setting up Git configuration..."
cp .gitconfig ~/.gitconfig
echo "✅ .gitconfig installed"

# Bashrc
echo "🐚 Setting up Bash configuration..."
if [ -f ~/.bashrc ]; then
    cp ~/.bashrc ~/.bashrc.backup
    echo "📋 Existing .bashrc backed up"
fi
cat .bashrc >> ~/.bashrc
echo "✅ .bashrc updated"

# Install required tools
echo "📦 Installing required tools..."
if command -v apt-get &> /dev/null; then
    sudo apt-get update
    sudo apt-get install -y git curl wget build-essential
elif command -v brew &> /dev/null; then
    brew install git curl wget
elif command -v pacman &> /dev/null; then
    sudo pacman -S --noconfirm git curl wget base-devel
fi
echo "✅ Tools installed"

# Git cleanup alias
echo "
# Clean up merged branches
git_cleanup_merged() {
    git branch --merged | grep -v '\\*\\|main\\|master' | xargs -n 1 git branch -d
}
" >> ~/.bashrc

echo ""
echo "🎉 Installation complete!"
echo "📝 To apply changes, restart your terminal or run:"
echo "   source ~/.bashrc"
echo ""
echo "Happy coding! 🚀"
