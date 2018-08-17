xged-init-pkgs() {
    sudo pacman -S --noconfirm --needed yaourt
    yaourt -S --noconfirm --needed bluez-utils google-chrome emacs adobe-source-code-pro-fonts tree aspell-en xorg-xbacklight
}
xged-init-fs() {
    rm -rf Music Pictures Public Templates Videos
}
xged-init-zsh() {
    echo 'export ZDOTDIR=$HOME/src/config/zsh' >$HOME/.zshenv  # this dir
    chsh -s $(which zsh)
}
xged-init-spacemacs() {
    git clone https://github.com/syl20bnr/spacemacs --branch develop --single-branch $HOME/.emacs.d
}
xged-init-git() {
    git config --global user.name "xged"
    git config --global user.email "xged90@gmail.com"
    git config --global rebase.autoStash true
}
xged-init() {
    xged-init-pkgs
    xged-init-fs
    # Copy old ~/src
    xged-init-zsh #! needs relogging
    # xged-init-xfce:
    #     set Settings_Manager/Window_Manager/Keyboard/Cycle_Windows to <F12>
    #     set Settings_Manager/Power_Manager/Display/Put_to_sleep_after&Switch_off_after to Never
    #     set <Terminal-window>/Edit/Preferences/Appearance/Background to None(use solid color)
    xged-init-spacemacs #| copy old ~/.emacs.d
    xged-init-git
}
