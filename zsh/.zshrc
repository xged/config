export ZSH=/home/xged/src/config/zsh/.oh-my-zsh
ZSH_THEME="robbyrussell"
# plugins=(git)
source $ZSH/oh-my-zsh.sh

export SPACEMACSDIR=$HOME/src/config/spacemacs
# export PYTHONPATH=$PYTHONPATH:$HOME/src/lang_char_freqs.py
export GOPATH=$HOME/go
export PATH=$GOPATH/bin:$PATH
# export PATH=~/.local/bin:$PATH

# File-system
f()    {cd $@ && ls}
alias  fd="rm -rf"
ff()   {cd .. $@ && ls}
fl()   {ls -a --ignore='.' --ignore='..' $@}
fdr() {mkdir $@ && cd $@}
ft()   {tree -a --dirsfirst -L 4 -I '.git' $@}
alias  fm="mv"
alias  fc="cp -r"
# Python
py()   {python $@}
pyp()  {sudo pip install -U $@}
pypd() {sudo pip uninstall $@}
pypu() {sudo pip list --outdated --format=freeze | grep -v '^\-e' | cut -d = -f 1  | xargs -n1 pip install -U}
pyt()  {pytest -s --cov-report term-missing --cov --durations=10 $@}
pyc()  {mypy --ignore-missing-imports *.py $@}
# Machine
mla()  {xbacklight -set 5}
mlb()  {xbacklight -set 8}
mlc()  {xbacklight -set 12}
mld()  {xbacklight -set 16}
mle()  {xbacklight -set 20}
mlp()  {xbacklight -inc 1}
mlm()  {xbacklight -dec 1}
# Package
p()    {yay -S --noconfirm --needed $@}
ps()   {yay --noconfirm --needed $@}
pf()   {yay -S --noconfirm --needed --force $@}
pd()   {yay -Rsc --noconfirm $@}
pu()   {yay -Syu --noconfirm $@}
# Session
sb()   {$@ &; disown %%; sleep 1; exit}
sd()   {kill $(pgrep $@); kill $(pgrep $@)}
# Node
n()  {tsc; node $@}
np() {sudo npm install $1 @types/"$@"}

unzip() {tar xzf $@}
git-stats-commits-d() {git log --no-merges --date=short --format='%ad' | sort | uniq -c}
git-stats-commits-w() {git log --no-merges --date=short --format='%ad' | sort | awk '{system("date -d "$1" +%V")}' | uniq -c}
xged-keyboard() {
  xfconf-query -c accessibility -p "/StickyKeys" -nt bool -s 'false'
  xfconf-query -c accessibility -p "/StickyKeys" -nt bool -s 'true'
  xkbcomp $HOME/src/config/linux/keyboard.xkb $DISPLAY -w0  # keymap
  xset r rate 150 30  # key repeat rate
}
xged-keyboard-bluetooth() {
    echo 'connect 34:88:5D:4A:DB:97' | bluetoothctl; sleep 3  # init: scan on
}
xged-startup-su() {
    sudo nmcli radio wifi off  # disable wireless
}
