#!/bin/bash
# install.sh - Dotfiles kurulum scripti
# BoraAITA - Kişisel geliştirici ortam yapılandırması

set -e

echo "🚀 Dotfiles kurulumu başlıyor..."
echo ""

# Git config
echo "📝 Git yapılandırması kuruluyor..."
cp .gitconfig ~/.gitconfig
echo "✅ .gitconfig kuruldu"

# Bashrc
echo "🐚 Bash yapılandırması kuruluyor..."
if [ -f ~/.bashrc ]; then
    cp ~/.bashrc ~/.bashrc.backup
    echo "📋 Mevcut .bashrc yedeklendi"
fi
cat .bashrc >> ~/.bashrc
echo "✅ .bashrc güncellendi"

# Gerekli araçları kur
echo "📦 Gerekli araçlar kuruluyor..."
if command -v apt-get &> /dev/null; then
    sudo apt-get update
    sudo apt-get install -y git curl wget build-essential
elif command -v brew &> /dev/null; then
    brew install git curl wget
elif command -v pacman &> /dev/null; then
    sudo pacman -S --noconfirm git curl wget base-devel
fi
echo "✅ Araçlar kuruldu"

# Git cleanup alias'ı
echo "
# Merge edilmiş branch'leri temizle
git_cleanup_merged() {
    git branch --merged | grep -v '\\*\\|main\\|master' | xargs -n 1 git branch -d
}
" >> ~/.bashrc

echo ""
echo "🎉 Kurulum tamamlandı!"
echo "📝 Değişikliklerin etkili olması için终端'ı yeniden başlatın veya:"
echo "   source ~/.bashrc"
echo ""
echo "Keyifli kodlamalar! 🚀"
