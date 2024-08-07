	sudo pacman-mirrors --fasttrack; sudo pacman -Syyu
	sudo pacman -S --noconfirm --needed yay
    yay -S --noconfirm --needed base-devel archlinux-keyring google-chrome emacs adobe-source-code-pro-fonts tree aspell-en xorg-xbacklight xsel xvkbd xorg-xrandr gnirehtet timew scrcpy imagewriter piper-git skypeforlinux-stable-bin notepadqq

    ZDOTDIR=/home/xged/src/config/shell
    echo 'ZDOTDIR=/home/xged/src/config/shell' >/home/xged/.zshenv
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
    
    mkdir src; cd src
    git clone https://github.com/xged/config
    git clone https://github.com/xged/misc
    git clone https://github.com/xged/python-scripts
    git clone https://github.com/xged/private    
    
    sudo cp /home/xged/src/config/grub /etc/default; sudo update-grub

    cp -r /mnt/home/xged/.emacs.d /mnt/home/xged/.zsh_history .
  
    rm -rf /home/xged/Music /home/xged/Pictures /home/xged/Public /home/xged/Templates /home/xged/Videos /home/xged/Documents /home/xged/Games
    sudo nmcli radio wifi off  # disable wireless
    gsettings set org.blueman.plugins.powermanager auto-power-on false  # disable bluetooth
    git config --global user.name "xged"
    git config --global user.email "xged90@gmail.com"
    git config --global rebase.autoStash true
    export HISTSIZE=1000000
    # disable compositor; restart
