#--------------------------------------------------------------------------------------#
#---------                      Common Sources & Aliases                   ------------#
#--------------------------------------------------------------------------------------#


#--------------------------------------------------------------------------------------#
alias aprint="awk='{print "\$"\!*}'"
alias bk='set back=$old;cd $back;unset back;set prompt = "`whoami`@`hostname`: `pwd` : "'
alias c='clear'
alias c1='cd ..'
alias c2='cd ../..'
alias c3='cd ../../..'
alias c4='cd ../../../..'
alias c5='cd ../../../../..'
alias chx='chmod			x'
alias cp='cp -i'
alias mv='mv -i'
alias cpr='rsync -tahvu --stats -P'
alias cpro='rsync -tahv --stats -P'
alias dfk='df -k .'
alias dir='l | grep "^d"'
alias files='l | grep "^-"'
alias dsk='du -sk .'
alias dsks='du -sk *'
alias dskss='du -sk * | sort -n'
alias eg='egrep'
alias egc='egrep -c'
alias egh='egrep -h'
alias egi='egrep -i'
alias egv='egrep -v'
alias backup="openbk;cp -rf  \!* /usr2/kphilip/.bk/.;closebk"
alias f='finger'			
alias g='/bin/grep --color=always'
alias ga='/bin/grep --color=auto'
alias gc='/bin/grep -c'
alias gcv='/bin/grep -c VIOLA'
alias gh='/bin/grep -h'
alias gi='/bin/grep --color=auto -i'
alias gv='/bin/grep -v'
alias h='history'
alias hh='history -h'
alias hn='hostname'
alias l='ls -lraht --color'
alias la='ls -hal'
alias ll='ls -p'
alias lll='ls -ptr'
alias lg="ls -lrat | egrep -i='\!*'"
alias lsg="ls -lrat | egrep -i='\!*' | aprint 9"
alias ls1="ls -1"
alias m='more'
alias n='/bin/nedit'
alias now='date +"%T"'
alias nowtime='now'
alias nowdate='date +"%d-%m-%Y"'
alias o='\!v'
alias openbk='chmod 700 ~/.bk'
alias closebk='chmod -w -R ~/.bk'
alias peek='tail -10'
alias r='cat \!*'
alias rc='\rm core*'
alias s='source ~/.bashrc'
alias sk='sort -k'
alias showpath="perl -e='print join (qq|\n|,@INC).qq|\n|'"
alias sp=' source env/setup/set_path'
alias top5files='find . -not -empty -type f -exec ls -s {} \; | sort -n -r | head -5'
alias usersloggedin='who | aprint 1 | uniq'
alias v='/usr/bin/vim'
alias x='exit'
alias fi='find . -name'

#--------------------------------------------------------------------------------------#
## pass options to free ## 
alias meminfo='free -m -l -t'
 
## get top process eating memory
alias psmem='ps auxf | sort -nr -k 4 | g `whoami`'
alias psmem10='ps auxf | sort -nr -k 4 | head -10'
 
## get top process eating cpu ##
alias pscpu='ps auxf | sort -nr -k 3 | g `whoami`'
alias pscpu10='ps auxf | sort -nr -k 3 | head -10'
 
## Get server cpu info ##
alias cpuinfo='lscpu'
 
## set some other defaults ##
alias df='df -H'
alias du='du -ch'

#progress bar on file copy. Useful evenlocal.
alias cpProgress="rsync --progress -ravz"

#--------------------------------------------------------------------------------------#
