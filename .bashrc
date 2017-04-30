# .bashrc

## Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

source ~/colorrc

#####################################

## Alias

alias grep='grep --color '
alias g='grep --color '
alias so='sudo '

export LS_COLORS="no=00:fi=00:di=1;38;5;81:ln=1;38;5;119:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:ex=01;32:*.tar=1;38;5;212:*.tgz=1;38;5;212:*.arj=1;38;5;212:*.taz=1;38;5;212:*.lzh=1;38;5;212:*.zip=1;38;5;212:*.z=1;38;5;212:*.Z=1;38;5;212:*.gz=1;38;5;212:*.bz2=1;38;5;212:*.deb=1;38;5;212:*.rpm=1;38;5;212:*.jar=1;38;5;212:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.avi=01;35:*.fli=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.ogg=01;35:*.mp3=01;35:*.wav=01;35:"

OSTYPE=$(uname)
if [[ "$OSTYPE" == 'FreeBSD' || "$OSTYPE" == "Darwin" ]]; then
  alias vi='mvim -v '
  alias cp='cp -i'
  alias l.='ls -d .* -G -F'
  alias ll='ls -l -G -F'
  alias ls='ls -G -F'
  alias mv='mv -i'
  alias rm='rm -i'
elif [[ "$OSTYPE" == 'Linux' ]]; then
  alias vi='vim'
  alias cp='cp -i'
  alias mv='mv -i'
  alias rm='rm -i'
  alias l.='ls -d .* --color=tty'
  alias ll='ls -l --color=tty'
  alias ls='ls --color=tty'
  alias which='alias | /usr/bin/which --tty-only --read-alias --show-dot --show-tilde'
fi

## Environment
export EDITOR="vim"
HISTFILESIZE=10000

function sync_ssh() {
    if [[ $# -lt 1 ]]; then
        return
    fi
    local host=$1
    RCs="${HOME}/.bashrc ${HOME}/.bash_profile ${HOME}/.vimrc ${HOME}/.vim ${HOME}/env"
    scp -r ${RCs} ${1}\: &> /dev/null
    ssh -A ${host}
}

############# Prompt ################

export MONTH=$(date +'%m')
export YEAR=$(date +'%Y')
export DAY=$(date +'%d')
HN="$(hostname | awk -F '.yahoo' '{print $1}')"

if [[ -z $STY ]]; then
PS1="\[${bgc_228}\]\[${fgc_196}\]TUH => \t \[${fgc_129}\]\u\[${fgc_18}\] @ \[${bold}\]\[${fgc_12}\]${HN} \[${nc}\]
\[${bgc_228}\]\[${fgc_196}\]PWD =>\[${nc}\]\[${fgc_46}\] \w\[${nc}\]
\[${bgc_228}\]\[${fgc_196}\]CMD =>\[${nc}\]\[${bold}\] \$ \[${nc}\] \[${bgc_0}\]"
else
PS1="\[${bgc_228}\]\[${fgc_196}\]TUH => \t \[${fgc_129}\]\u\[${fgc_18}\] @ \[${bold}\]\[${fgc_12}\]${HN} \[${fgc_233}\] Screen: \[${fgc_129}\]$STY:$WINDOW\[ ${nc}\]
\[${bgc_228}\]\[${fgc_196}\]PWD =>\[${nc}\]\[${fgc_46}\] \w\[${nc}\]
\[${bgc_228}\]\[${fgc_196}\]CMD =>\[${nc}\]\[${bold}\] \$ \[${nc}\] \[${bgc_0}\]"
fi

case $TERM in
    xterm*)
    # Set xterm's title
    export TERM="xterm-256color"
    ;;
    screen*)
    # Use path as title
    HOSTTITLE='\[\ek${HN}\e\\\]'
    # Use program name as title
    PS1="${HOSTTITLE}${PS1}"
    ;;
    *)
    ;;
esac
export PS1
