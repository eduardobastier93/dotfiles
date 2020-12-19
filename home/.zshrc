# github.com/mamutal91

# Themes https://github.com/robbyrussell/oh-my-zsh/wiki/Themes

ZSH=/usr/share/oh-my-zsh/
ZSH_THEME="robbyrussell"
plugins=(git)

ZSH_CACHE_DIR=$HOME/.cache/oh-my-zsh
if [[ ! -d $ZSH_CACHE_DIR ]]; then
  mkdir $ZSH_CACHE_DIR
fi

source $ZSH/oh-my-zsh.sh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

export LS_COLORS="$LS_COLORS:ow=1;34:tw=1;34:"
export TERM="xterm-256color"
export EDITOR="nano"
export BROWSER="/usr/bin/google-chrome-beta"

export iconpath="/usr/share/icons/Papirus-Dark/32x32/devices"

# sudo easy
alias chmod="sudo chmod"
alias mv="sudo mv"
alias pacman="sudo pacman"
alias pkill="sudo pkill"
alias rm="sudo rm"
alias systemctl="sudo systemctl"
alias sed="sudo sed"

# paths
alias github="cd /media/storage/GitHub && clear && ls -1"
alias aospk="cd /media/storage/AOSPK && clear && ls -1"
alias x="cd /home/rom/AOSPK"
alias buildbot="cd /home/buildbot"

if [ "$USER" = "mamutal91" ];
then
  source $HOME/.cmds.sh
  function cmds () {
    pwd=$(pwd)
    cd $HOME
    rm -rf $HOME/.cmds.sh && wget https://raw.githubusercontent.com/mamutal91/dotfiles/master/home/.cmds.sh && chmod +x $HOME/.cmds.sh && source $HOME/.zshrc
    rm -rf $HOME/.zshrc && wget https://raw.githubusercontent.com/mamutal91/dotfiles/master/home/.zshrc && source $HOME/.zshrc
    cd $HOME && sudo rm -rf /home/buildbot $HOME/buildbot && git clone https://github.com/mamutal91/buildbot && sudo mv buildbot /home/
    cd $pwd
  }
fi
