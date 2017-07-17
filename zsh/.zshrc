export ZSH=/home/xged/.oh-my-zsh
ZSH_THEME="robbyrussell"
# plugins=(git)
source $ZSH/oh-my-zsh.sh

export PYTHONPATH=$PYTHONPATH:$HOME/src/lang_char_freqs.py
export SPACEMACSDIR=$HOME/src/config/spacemacs
DEPPKG='
  base-devel yaourt
  bluez bluez-utils
  google-chrome
  emacs
  adobe-source-code-pro-fonts
  tree
  aspell-en
'

# App
ae()   {emacs --load ~/.emacs.d/core/templates/.spacemacs.template $@}
# Legacy
c()    {cd $@ && ls}
cc()   {cd .. $@ && ls}
# File-system
f()    {cd $@ && ls}
alias  fd="rm -rf"
ff()   {cd .. $@ && ls}
fl()   {ls -a --ignore='.' --ignore='..' $@}
fm()   {mkdir $@ && cd $@}
ft()   {tree -a --dirsfirst -L 4 -I '.git' $@}
# Lang
lp()   {python $@}
lpp()  {sudo pip install -U $@}
lppd() {sudo pip uninstall $@}
lppu() {sudo pip install --upgrade --force-reinstall $@}
lpt()  {pytest -s --cov-report term-missing --cov --durations=10 $@}
lpc()  {mypy --ignore-missing-imports *.py $@}
# Machine
ml()   {xbacklight -set 3}
mL()   {xbacklight -set 6}
mlp()  {xbacklight -inc 1}
mlm()  {xbacklight -dec 1}
# Package
p()    {yaourt -S --noconfirm --needed $@}
pf()   {yaourt -S --noconfirm --needed --force $@}
pd()   {yaourt -Rsc --noconfirm $@}
pu()   {yaourt -Syua --noconfirm $@}
# Session
sb()   {$@ &; disown %%; sleep 1; exit}
sd()   {kill $(pgrep $@); kill $(pgrep $@)}

unzip() {tar xzf $@}
spacemacs-install() {git clone https://github.com/syl20bnr/spacemacs
                     --branch develop --single-branch $HOME/.emacs.d}
spacemacs-update() {cd $HOME/.emacs.d; git pull; cd -}
git-stats-commits-d() {git log --no-merges --date=short --format='%ad' | sort | uniq -c}
git-stats-commits-w() {git log --no-merges --date=short --format='%ad' | sort | awk '{system("date -d "$1" +%V")}' | uniq -c}
xged-kb() {
  xfconf-query -c accessibility -p "/StickyKeys" -nt bool -s 'false'
  xfconf-query -c accessibility -p "/StickyKeys" -nt bool -s 'true'
  xkbcomp $HOME/src/config/archlinux/keyboard.xkb $DISPLAY -w0  # keymap
  xset r rate 150 30  # key repeat rate
}

xged-kb-bt() {echo 'connect 34:88:5D:4A:DB:97' | bluetoothctl; sleep 3; xged-kb}  # init: scan on
xged-init-linux() {
  echo 'export ZDOTDIR=$HOME/src/config/zsh' >$HOME/.zshenv  # this dir
  # sudo ln -s /usr/lib64/libncursesw.so.6 /usr/lib64/libtinfo.so.5
}
xged-init-xfce() {  # ~/.config/xfce4/xfconf/xfce-perchannel-xml/
  xfconf-query -c xfce4-keyboard-shortcuts -p "/xfwm4/default/F12" -nt string -s "cycle_windows_key"  #!
  xfconf-query -c xfce4-keyboard-shortcuts -p "/commands/custom/<Alt>b" -nt string -s "zsh -ic xged-kb-bt"
  xfconf-query -c xfce4-keyboard-shortcuts -p "/commands/custom/<Alt>e" -nt string -s "zsh -ic emacs"
}
xged-init-git() {
  git config --global user.name "xged"
  git config --global user.email "xged90@gmail.com"
  git config --global rebase.autoStash true
}
xged-init() {xged-init-linux; xged-init-xfce; xged-init-git}
xged-startup() {xged-kb}
xged-startup-su() {
  xged-startup
  sudo ifconfig wlp2s0 down  # disable wireless
  sudo sysctl -w vm.vfs_cache_pressure=100  # default 100
}
