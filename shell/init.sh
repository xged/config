    sudo pacman -S --noconfirm --needed yay
    yay -S --noconfirm --needed base-devel archlinux-keyring google-chrome-dev emacs adobe-source-code-pro-fonts tree aspell-en xorg-xbacklight xsel xvkbd xorg-xrandr gnirehtet timew scrcpy imagewriter piper-git skypeforlinux-stable-bin notepadqq

    export ZDOTDIR=home/xged/src/config/shell
    echo 'export ZDOTDIR=home/xged/src/config/shell' >/home/xged/.zshenv
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

    cp -r /mnt/home/xged/src /mnt/home/xged/.emacs.d /mnt/home/xged/.zsh_history .
    cp -r /mnt/etc/default/grub /etc/default
    update-grub

    rm -rf /home/xged/Music /home/xged/Pictures /home/xged/Public /home/xged/Templates /home/xged/Videos /home/xged/Documents /home/xged/Games
    sudo nmcli radio wifi off  # disable wireless
    git config --global user.name "xged"
    git config --global user.email "xged90@gmail.com"
    git config --global rebase.autoStash true
    export HISTSIZE=1000000
    # restart
