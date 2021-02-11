xged-init-sda() {  # xged-init-sda /dev/sda3
    sudo pacman -S --noconfirm --needed yay
    yay -S --noconfirm --needed bluez-utils google-chrome emacs adobe-source-code-pro-fonts tree aspell-en xorg-xbacklight xsel xvkbd redshift gnirehtet timew

    export ZDOTDIR=$HOME/src/config/shell
    echo 'export ZDOTDIR=$HOME/src/config/shell' >$HOME/.zshenv
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

    sudo mount $1 /mnt
    cp -r /mnt/$HOME/src /mnt/$HOME/.emacs.d /mnt/$HOME/.config /mnt/$HOME/.zsh_history /mnt/$HOME/.xinitrc $HOME
    cp -r /mnt/etc/default/grub /etc/default

    rm -rf $HOME/Music $HOME/Pictures $HOME/Public $HOME/Templates $HOME/Videos $HOME/Documents $HOME/Games
    sudo nmcli radio wifi off  # disable wireless
    git config --global user.name "xged"
    git config --global user.email "xged90@gmail.com"
    git config --global rebase.autoStash true
    #! relog
}
