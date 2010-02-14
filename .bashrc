#check if shell is interactive
if [[ $- != *i* ]] ; then
	# Shell is non-interactive.  Be done now!
	return
fi

if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

#aliases
alias netcfg='sudo netcfg'
alias emerge='sudo emerge -av'
alias pacman='sudo pacman'
alias ls='ls --color=auto'
alias chat='weechat-curses'
alias dl='cd ~/Downloads && clear && ls -lh'
alias bashrc="vi ~/.bashrc"
alias roxdate='cd ~/www/foxjames/linux/rox && rm rox.db.tar.gz && repo-add rox.db.tar.gz *.pkg.tar.gz'
alias aurbuild='sudo EDITOR="vi" aurbuild -sm'
alias aursearch='aurbuild -S'
alias grep='grep --colour=auto'
alias cdold='cd $OLDPWD'
alias swj='ssh swj@81.149.29.112'
alias ratrc="vi ~/.ratpoisonrc && ratpoison -c restart"
alias netsearch="sudo wifi-select wlan0"
alias wifi-select="sudo wifi-select wlan0"
alias oldpkg="chromium-browser http://schlunix.org/archlinux/"
alias bit="transmission-remote reddwarf"
alias nocomment='egrep -v "^\s*(#|$)"'
alias ncmpc='ncmpc -c'
alias wdir='cd /wine/drive_c/Program\ Files'
alias x='startx'
eval `dircolors -b`
# git aliases
alias gpush="git commit -a -m '`cat .gitdots`' && git push github master"

#var#
export EDITOR="vi"
export PS1='\[\033[01;32m\]\u@\h\[\033[01;34m\] \w \$\[\033[00m\] '
export WIILOAD='tcp:wii'
#var for colour in less
export LESS_TERMCAP_mb=$'\e[1;31m'
export LESS_TERMCAP_md=$'\e[1;31m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[1;44;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;32m'

# Change the window title of X terminals 
case ${TERM} in                          
        xterm*|rxvt*|Eterm|aterm|kterm|gnome*|interix)
                PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME%%.*}:${PWD/$HOME/~}\007"'                                                                   
                ;;                                                              
        screen)                                                                 
PROMPT_COMMAND='echo -ne "\033_${USER}@${HOSTNAME%%.*}:${PWD/$HOME/~}\033\\"'                                                                   
                ;;                                                              
esac 


#dir size
dirsize ()
{
du -shx * .[a-zA-Z0-9_]* 2> /dev/null | \
egrep '^ *[0-9.]*[MG]' | sort -n > /tmp/list
egrep '^ *[0-9.]*M' /tmp/list
egrep '^ *[0-9.]*G' /tmp/list
rm -rf /tmp/list
}


#cp abs pkgbuild and cd to it at ~
absbuild ()
{
export ABSPATH=`find /var/abs -type d -name $1` || return 1
mkdir -p ~/.abs/$1 || return 1
cp -R $ABSPATH/* ~/.abs/$1 || return 1
cd ~/.abs/$1 || return 1
vi PKGBUILD
makepkg -f || return 1
pacman -U $1*i686.pkg.tar.gz
}

#create symlinks between offline documents ~
homelink ()
{
ln -s /home/gary/Documents/$1 /home/gary/$1
}

# daemon controls
start()
{
for arg in $*; do
sudo /etc/rc.d/$arg start
done
}

restart()
{
for arg in $*; do
sudo /etc/rc.d/$arg restart
done
}

stop()
{
for arg in $*; do
sudo /etc/rc.d/$arg stop
done
}
