# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="ys"
#"ys"
#"jonathan"
#"junkfood"
#"rkj-repos"
#"duellj"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

# User configuration

# export PATH="/usr/bin:/bin:/usr/sbin:/sbin:$PATH"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

alias shut='systemctl poweroff'
alias res='systemctl reboot'
alias sus='systemctl suspend'
alias hib='systemctl hibernate'

alias nr='systemctl restart NetworkManager.service'

###########################################
############### GIT aliases ###############
###########################################
alias gc='git commit -m'
alias ga='git add'
alias gps='git push'
alias gpl='git pull'
alias gcl='git clone'

##########################################
######## For Ubuntu & derivatives ########
##########################################
alias rmv='sudo apt-get autoremove; sudo apt-get autoclean; sudo apt-get clean'
alias uinst='sudo apt-get remove --purge'
alias inst='sudo apt-get install'
alias upg='sudo apt-get upgrade'
alias upd='sudo apt-get update'
alias aar='sudo add-apt-repository'
alias dupg='sudo apt-get dist-upgrade'
alias instnir='sudo apt-get install --no-install-recommends'
alias au='sudo apt update'
##########################################

##########################################
########## Youtube-dl on Ubuntu ##########
##########################################
alias ytbu='sudo youtube-dl -U'
alias ytb='bash ~/scripts/youtube.sh'
##########################################

##########################################
############## Miscellanous ##############
##########################################
alias mc='mc -b'
alias t-r="transmission-remote"
alias todo='vim $HOME/Documents/thingstodo/list'
alias a='bash $HOME/scripts/system/notify.sh'
alias reset='tput reset'
##########################################

##########################################
######## Yaourt for git packages #########
##########################################
LOCATION=/home/rexdrive/git
alias aur-ibus='cd /home/rexdrive/git/yaourt/ibus-avro && git pull origin master && mkdir -p /tmp/yaourt-tmp-rexdrive/aur-ibus-avro-git/src && cp -r /home/rexdrive/git/yaourt/ibus-avro /tmp/yaourt-tmp-rexdrive/aur-ibus-avro-git/src/ibus-avro-git'
alias aur-mps='cd /home/rexdrive/git/yaourt/mps-youtube && git pull origin master && cp -r /home/rexdrive/git/yaourt/mps-youtube /tmp/yaourt-tmp-rexdrive/aur-mps-youtube-git/mps-youtube'
alias aur-numix='cd /home/rexdrive/git/yaourt/numix-icon-theme && git pull origin master && cp -r /home/rexdrive/git/yaourt/numix-icon-theme /tmp/yaourt-tmp-rexdrive/aur-numix-icon-theme-git/numix-icon-theme'
alias aur-numic='cd /home/rexdrive/git/yaourt/numix-icon-theme-circle && git pull origin master && cp -r /home/rexdrive/git/yaourt/numix-icon-theme-circle /tmp/yaourt-tmp-rexdrive/aur-numix-circle-icon-theme-git/numix-circle-icon-theme'
alias aur-pafy='cd /home/rexdrive/git/yaourt/pafy && git pull origin master && cp -r /home/rexdrive/git/yaourt/pafy /tmp/yaourt-tmp-rexdrive/aur-python-pafy-git/pafy'
alias aur-youtube-dl='cd /home/rexdrive/git/yaourt/youtube-dl && git pull origin master && cp -r /home/rexdrive/git/yaourt/youtube-dl /tmp/yaourt-tmp-rexdrive/aur-youtube-dl-git/youtube-dl'
alias aur-zsh-completions='cd /home/rexdrive/git/yaourt/zsh-completions && git pull origin master && cp -r /home/rexdrive/git/yaourt/zsh-completions /tmp/yaourt-tmp-rexdrive/aur-zsh-completions-git/zsh-completions'
##########################################

# Define ls colors
export LS_COLORS="no=00:fi=00:di=34:ow=34;40:ln=35:pi=30;44:so=35;44:bd=33;44:cd=37;44:or=05;37;41:mi=05;37;41:ex=01;31:*.txt=32:*.org=32:*.md=32:*.mkd=32:*.h=32:*.hpp=32:*.c=32:*.C=32:*.cc=32:*.cpp=32:*.cxx=32:*.objc=32:*.cl=32:*.sh=32:*.bash=32:*.csh=32:*.zsh=32:*.el=32:*.vim=32:*.java=32:*.pl=32:*.pm=32:*.py=32:*.rb=32:*.hs=32:*.php=32:*.htm=32:*.html=32:*.shtml=32:*.erb=32:*.haml=32:*.xml=32:*.rdf=32:*.css=32:*.sass=32:*.scss=32:*.less=32:*.js=32:*.coffee=32:*.man=32:*.0=32:*.1=32:*.2=32:*.3=32:*.4=32:*.5=32:*.6=32:*.7=32:*.8=32:*.9=32:*.l=32:*.n=32:*.p=32:*.pod=32:*.tex=32:*.go=32:*.sql=32:*.csv=32:*.bmp=33:*.cgm=33:*.dl=33:*.dvi=33:*.emf=33:*.eps=33:*.gif=33:*.jpeg=33:*.jpg=33:*.JPG=33:*.mng=33:*.pbm=33:*.pcx=33:*.pgm=33:*.png=33:*.PNG=33:*.ppm=33:*.pps=33:*.ppsx=33:*.ps=33:*.svg=33:*.svgz=33:*.tga=33:*.tif=33:*.tiff=33:*.xbm=33:*.xcf=33:*.xpm=33:*.xwd=33:*.xwd=33:*.yuv=33:*.aac=33:*.au=33:*.flac=33:*.m4a=33:*.mid=33:*.midi=33:*.mka=33:*.mp3=33:*.mpa=33:*.mpeg=33:*.mpg=33:*.ogg=33:*.opus=33:*.ra=33:*.wav=33:*.anx=33:*.asf=33:*.avi=33:*.axv=33:*.flc=33:*.fli=33:*.flv=33:*.gl=33:*.m2v=33:*.m4v=33:*.mkv=33:*.mov=33:*.MOV=33:*.mp4=33:*.mp4v=33:*.mpeg=33:*.mpg=33:*.nuv=33:*.ogm=33:*.ogv=33:*.ogx=33:*.qt=33:*.rm=33:*.rmvb=33:*.swf=33:*.vob=33:*.webm=33:*.wmv=33:*.pdf=36:*.doc=36:*.docx=36:*.rtf=36:*.odt=36:*.dot=36:*.dotx=36:*.ott=36:*.xls=36:*.xlsx=36:*.ods=36:*.ots=36:*.ppt=36:*.pptx=36:*.odp=36:*.otp=36:*.fla=36:*.psd=36:*.7z=1;35:*.apk=1;35:*.arj=1;35:*.bin=1;35:*.bz=1;35:*.bz2=1;35:*.deb=1;35:*.gem=1;35:*.gz=1;35:*.iso=1;35:*.jar=1;35:*.rar=1;35:*.rpm=1;35:*.tar=1;35:*.tbz=1;35:*.tbz2=1;35:*.tgz=1;35:*.tx=1;35:*.war=1;35:*.xpi=1;35:*.xz=1;35:*.z=1;35:*.Z=1;35:*.zip=1;35:*.ANSI-30-black=30:*.ANSI-01;30-brblack=01;30:*.ANSI-31-red=31:*.ANSI-01;31-brred=01;31:*.ANSI-32-green=32:*.ANSI-01;32-brgreen=01;32:*.ANSI-33-yellow=33:*.ANSI-01;33-bryellow=01;33:*.ANSI-34-blue=34:*.ANSI-01;34-brblue=01;34:*.ANSI-35-magenta=35:*.ANSI-01;35-brmagenta=01;35:*.ANSI-36-cyan=36:*.ANSI-01;36-brcyan=01;36:*.ANSI-37-white=37:*.ANSI-01;37-brwhite=01;37:*.log=01;32:*~=01;32:*#=01;32:*.bak=01;33:*.BAK=01;33:*.old=01;33:*.OLD=01;33:*.org_archive=01;33:*.off=01;33:*.OFF=01;33:*.dist=01;33:*.DIST=01;33:*.orig=01;33:*.ORIG=01;33:*.swp=01;33:*.swo=01;33:*,v=01;33:*.gpg=34:*.gpg=34:*.pgp=34:*.asc=34:*.3des=34:*.aes=34:*.enc=34:*.sqlite=34"
