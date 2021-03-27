export ZSH=/home/xged/src/config/shell/.oh-my-zsh
ZSH_THEME="robbyrussell"
# plugins=(git)
source $ZSH/oh-my-zsh.sh

export SPACEMACSDIR=$HOME/src/config/spacemacs

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
pyp()  {pip install -U $@}
pypd() {pip uninstall $@}
pyt()  {pytest -s --cov-report term-missing --cov --durations=10 $@}
pyc()  {mypy --ignore-missing-imports *.py $@}
# Machine
mla()  {xbacklight -set 6}
mlb()  {xbacklight -set 8}
mlc()  {xbacklight -set 11}
mld()  {xbacklight -set 15}
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
sd()   {kill $(pgrep $@); kill $(pgrep $@)}
# Node
n()  {tsc; node $@}
np() {sudo npm install $1 @types/"$@"}

x-unzip() {tar xzf $@}
git-stats-commits-d() {git log --no-merges --date=short --format='%ad' | sort | uniq -c}
git-stats-commits-w() {git log --no-merges --date=short --format='%ad' | sort | awk '{system("date -d "$1" +%V")}' | uniq -c}
x-kb() {
  xfconf-query -c accessibility -p "/StickyKeys" -nt bool -s 'false'
  xfconf-query -c accessibility -p "/StickyKeys" -nt bool -s 'true'
  xkbcomp $HOME/src/config/keyboard.xkb $DISPLAY -w0  # keymap
  xset r rate 150 30  # key repeat rate
}
x-trash() {echo -n Taking out the trash | pv -qL 10 && rm -rf  ~/.local/share/Trash/files}
x-du() {du -m --max-depth=1 $@ | sort -n -r | head -n 30}
x-perm-dir() {sudo chown xged $@ -R}
x-kb-off() {sudo modprobe -r atkbd}
x-lightscolor() {redshift -x; redshift -O 3500}
x-perf(){
    sudo cpupower frequency-set -g performance
    sudo systemctl enable fstrim.timer
    sudo systemctl start fstrim.timer
}

alias x="x-kb; mla; x-lightscolor; xmodmap -e \"pointer = 1 3 2\""
alias xsu='x; x-perf; x-kb-off'

# Archive
pypu() {pip list --outdated --format=freeze | grep -v '^\-e' | cut -d = -f 1  | xargs -n1 pip install -U}
x-kb-bt() {echo 'connect 34:88:5D:4A:DB:97' | bluetoothctl; sleep 3}  # init: scan on
x-rerun(){
    until $@; do
        echo "Server 'myserver' crashed with exit code $?.  Respawning.." >&2
        sleep 1
    done
}
x-mysterylines (){
    sed -n "$( echo "$@" | sed 's/[0-9]\+/&p;/g')"
}
x-count-lines() {cat $@ | awk 'NF' | wc -l}
x-git-log() {GIT_PAGER=cat; git log -p --all --reverse $@ | sed -n '/^-/p'}
