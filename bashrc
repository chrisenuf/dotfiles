
# FUNCTIONS
#display git branch in PS1
#get_git_branch() {
#  git branch 2>/dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
#}

get_git_branch() {
  git branch 2>/dev/null | grep '^*' | colrm 1 2
}

#activate_venv() {
#  if [ -d venv ]; then
##    echo "(venv) "              #TODO fix this so the activation works
#    source venv/bin/activate >/dev/null 2>&1
#  else
#    deactivate 2> /dev/null
#  fi
#}

#ssh autocomplete
_complete_ssh_hosts ()
{
        COMPREPLY=()
        cur="${COMP_WORDS[COMP_CWORD]}"
        comp_ssh_hosts=`cat ~/.ssh/known_hosts | \
                        cut -f 1 -d ' ' | \
                        sed -e s/,.*//g | \
                        grep -v ^# | \
                        uniq | \
                        grep -v "\[" ;
                cat ~/.ssh/config | \
                        grep "^Host " | \
                        awk '{print $2}'
                `
        COMPREPLY=( $(compgen -W "${comp_ssh_hosts}" -- $cur))
        return 0
}
complete -F _complete_ssh_hosts ssh

# ENVIRONMENT VARIABLES
LSCOLORS=GxFxCxDxBxegedabagaced; export LSCOLORS
PS1="\[\033[0;94m\]\u\[\033[0m\]@\[\033[0;32m\]\h\[\033[1;33m\]: \w\[\033[0;96m\] (\$(get_git_branch))\[\033[0m\] "; export PS1

#PS1="\[\033[0;94m\]\u\[\033[0m\]@\[\033[0;32m\]\h\[\033[1;33m\]: \w\[\033[0;96m\]$(get_git_branch)\[\033[0m\] $ \[\033[0;96m\]\$(activate_venv)\[\033[0m\]"; export PS1

# TOOL ALIASES
flaskup() {
  export FLASK_APP=$1; flask run --host=0.0.0.0
}


# COMMAND ALIASES
alias ls="ls -F"


# LOAD TOOLS
source ~/.git-completion.bash
