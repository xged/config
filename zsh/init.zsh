xged-init-pkgs() {
    sudo pacman -S --noconfirm --needed yay
    yay -S --noconfirm --needed bluez-utils google-chrome emacs adobe-source-code-pro-fonts tree aspell-en xorg-xbacklight
}
xged-init-main() {
    sudo mount $1 /mnt
    cp -r /mnt/home/xged/src $HOME
    cp -r /mnt/home/xged/.emacs.d $HOME
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
    echo 'export ZDOTDIR=$HOME/src/config/zsh' >$HOME/.zshenv
    # relog
}
xged-init-xfce() {
    # Settings Manager: Window_Manager: Keyboard: Cycle Windows: <F12>
    # set Settings_Manager/Keyboard/Application_Shortcuts: < sh -c 'xdotool type "$(xsel)"' > to <M-:>
    sudo nmcli radio wifi off  # disable wireless
}
xged-init-fs() {
    rm -rf Music Pictures Public Templates Videos
}
xged-init-git() {
    git config --global user.name "xged"
    git config --global user.email "xged90@gmail.com"
    git config --global rebase.autoStash true
}
