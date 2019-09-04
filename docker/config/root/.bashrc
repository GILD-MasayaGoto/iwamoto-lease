export LSCOLORS=cxfxcxdxbxegedabagacad
alias la='ls -laG'
alias ll='ls -laG'
alias tree="pwd;find . | sort | sed '1d;s/^\.//;s/\/\([^/]*\)$/|--\1/;s/\/[^/|]*/| /g'"
PS1="\e[0;32m\][Local-IwamotoLease]\e[m\][\u@\h:\l \W]\\$ "