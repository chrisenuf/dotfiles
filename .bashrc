
# FUNCTIONS
get_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

# ENVIRONMENT VARIABLES
LSCOLORS=GxFxCxDxBxegedabagaced; export LSCOLORS
PS1="\[\033[0;94m\]\u\[\033[0m\]@\[\033[0;32m\]\h\[\033[1;33m\]: \w\[\033[0;96m\]\$(get_git_branch)\[\033[0m\] $: "; export PS1



# TOOL ALIASES
flaskup() {
  export FLASK_APP=$1; flask run --host=0.0.0.0
}


# COMMAND ALIASES
alias ls="ls -FG"

# LOAD TOOLS
source ~/.git-completion.bash

# work shit
yelpbox() {
  ssh -A -l cgordon dev31-devc
}
