#---------------------------
#  DIRECTORIES
#---------------------------

alias dotfiles="cd $DOTFILES"
alias library="cd $HOME/Library"
alias home="cd $HOME"
alias desktop="cd $HOME/Desktop"

# alias ll="/usr/local/opt/coreutils/libexec/gnubin/ls -AhlFo --color --group-directories-first"
alias path='echo -e ${PATH//:/\\n}'         # path:         Echo all executable Paths

alias l='ls -lahpt'
alias la='ls -lAhpt'
alias ll='ls -lhpt'
alias ls='ls -Gpt'
alias lsa='ls -lahpt'
alias lt='tree'

alias md='mkdir -p'
alias -='cd -'
alias ...=../..
alias ....=../../..
alias .....=../../../..
alias ......=../../../../..
alias 1='cd -'
alias 2='cd -2'
alias 3='cd -3'
alias 4='cd -4'
alias 5='cd -5'
alias 6='cd -6'
alias 7='cd -7'
alias 8='cd -8'
alias 9='cd -9'
alias rd=rmdir

#   lr:  Full Recursive Directory Listing
alias lr='ls -R | grep ":$" | sed -e '\''s/:$//'\'' -e '\''s/[^-][^\/]*\//--/g'\'' -e '\''s/^/   /'\'' -e '\''s/-/|/'\'' | less'

alias cp='cp -iv'                           # Preferred 'cp' implementation
alias mv='mv -iv'                           # Preferred 'mv' implementation
alias mkdir='mkdir -pv'                     # Preferred 'mkdir' implementation
alias ll='ls -FGlAhp'                       # Preferred 'ls' implementation
alias less='less -FSRXc'                    # Preferred 'less' implementation
# cd() { builtin cd "$@"; ll; }               # Always list directory contents upon 'cd'

#---------------------------
#  FILES / SEARCH
#---------------------------
alias afind='ack -il'
alias egrep='egrep --color=auto --exclude-dir={.bzr,CVS,.git,.hg,.svn,.idea,.tox}'
alias fgrep='fgrep --color=auto --exclude-dir={.bzr,CVS,.git,.hg,.svn,.idea,.tox}'
alias which-command=whence
alias cleanupDS='find . -type f -name '\''*.DS_Store'\'' -ls -delete'

alias datestamp='date +"%Y%m%d_%H%M_%S'

alias qfind="find . -name "                 # qfind:    Quickly search for file
#ff () { /usr/bin/find . -name "$@" ; }      # ff:       Find file under the current directory
#ffs () { /usr/bin/find . -name "$@"'*' ; }  # ffs:      Find file whose name starts with a given string
#ffe () { /usr/bin/find . -name '*'"$@" ; }  # ffe:      Find file whose name ends with a given string

#   spotlight: Search for a file using MacOS Spotlight's metadata
#   -----------------------------------------------------------
#    spotlight () { mdfind "kMDItemDisplayName == '$@'wc"; }

#---------------------------
#  JavaScript / Node
#---------------------------

alias cleannode="rm -rf node_modules/ package-lock.json && npm install"
alias watch="npm run watch"


#---------------------------
#  NETWORKING
#---------------------------

alias myip='curl ip.appspot.com'                    # myip:         Public facing IP Address
alias netCons='lsof -i'                             # netCons:      Show all open TCP/IP sockets
alias flushDNS='dscacheutil -flushcache'            # flushDNS:     Flush out the DNS Cache
alias lsock='sudo /usr/sbin/lsof -i -P'             # lsock:        Display open sockets
alias lsockU='sudo /usr/sbin/lsof -nP | grep UDP'   # lsockU:       Display only open UDP sockets
alias lsockT='sudo /usr/sbin/lsof -nP | grep TCP'   # lsockT:       Display only open TCP sockets
alias ipInfo0='ipconfig getpacket en0'              # ipInfo0:      Get info on connections for en0
alias ipInfo1='ipconfig getpacket en1'              # ipInfo1:      Get info on connections for en1
alias openPorts='sudo lsof -i | grep LISTEN'        # openPorts:    All listening connections
alias showBlocked='sudo ipfw list'                  # showBlocked:  All ipfw rules inc/ blocked IPs
alias nsl='nslookup -query=any '
alias openPorts='sudo lsof -i | grep LISTEN'
alias showBlocked='sudo ipfw list'


#---------------------------
#  PROCESS MANAGEMENT
#---------------------------

#   findPid: find out the pid of a specified process
#       Note that the command name can be specified via a regex
#       E.g. findPid '/d$/' finds pids of all processes with names ending in 'd'
#       Without the 'sudo' it will only find processes of the current user
#findPid () { lsof -t -c "$@" ; }

#   memHogsTop, memHogsPs:  Find memory hogs
alias memHogsTop='top -l 1 -o rsize | head -20'
alias memHogsPs='ps wwaxm -o pid,stat,vsize,rss,time,command | head -10'

#   cpuHogs:  Find CPU hogs
alias cpu_hogs='ps wwaxr -o pid,stat,%cpu,time,command | head -10'

#   topForever:  Continual 'top' listing (every 10 seconds)
alias topForever='top -l 9999999 -s 10 -o cpu'

#   ttop:  Recommended 'top' invocation to minimize resources
#       Taken from this macosxhints article
#       http://www.macosxhints.com/article.php?story=20060816123853639
  alias ttop="top -R -F -s 10 -o rsize"
alias topForever='top -l 9999999 -s 10 -o cpu'

#   my_ps: List processes owned by my user:
#   ------------------------------------------------------------
#    my_ps() { ps $@ -u $USER -o pid,%cpu,%mem,start,time,bsdtime,command ; }


#---------------------------
#  OTHER SHORTCUTS
#---------------------------

alias copyssh="pbcopy < $HOME/.ssh/id_rsa.pub"
alias reloadshell="source $HOME/.zshrc"
alias shrug="echo '¯\_(ツ)_/¯' | pbcopy"
alias c="clear"

alias _='sudo '
alias dr='defaults read '
alias history=omz_history
alias run-help=man


#---------------------------
#  SERVERS
#---------------------------
alias sshrvelo='ssh nasadmin@rvelonas.local -p 9955 -i ~/.ssh/id_rsa_rvelonas'

# alias show_options='shopt'                  # Show_options: display bash options settings
# Ring the terminal bell, and put a badge on Terminal.app’s Dock icon
# (useful when executing time-consuming commands)
#alias badge="tput bel"

# Intuitive map function
# For example, to list all directories that contain a certain file:
# find . -name .gitattributes | map dirname
#alias map="xargs -n1"

# Stuff I never really use but cannot delete either because of http://xkcd.com/530/
alias mute="osascript -e 'set volume output muted true'"
alias unmute="osascript -e 'set volume output muted false'"
alias loud="osascript -e 'set volume 7'"

# Kill all the tabs in Chrome to free up memory
# [C] explained: http://www.commandlinefu.com/commands/view/402/exclude-grep-from-your-grepped-output-of-ps-alias-included-in-description
alias chromekill="ps ux | grep '[C]hrome Helper --type=renderer' | grep -v extension-process | tr -s ' ' | cut -d ' ' -f2 | xargs kill"

# Lock the screen (when going AFK)
alias afk="/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend"

# Hide/show all desktop icons (useful when presenting)
alias hideall="defaults write com.apple.finder CreateDesktop -bool false && killall Finder"
alias showall="defaults write com.apple.finder CreateDesktop -bool true && killall Finder"

# Reload the shell (i.e. invoke as a login shell)
alias reload="exec $SHELL -l"
