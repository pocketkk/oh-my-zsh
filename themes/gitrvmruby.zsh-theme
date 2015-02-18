if [ -e ~/.rvm/bin/rvm-prompt ]; then
  J_CURRENT_RUBY_="%{$fg[white]%}[%{$fg[green]%}\$(~/.rvm/bin/rvm-prompt i v)%{$fg[white]%}]%{$reset_color%}"
else
  if which rbenv &> /dev/null; then
    J_CURRENT_RUBY_="%{$fg[white]%}[%{fg[red]%}\$(rbenv version | sed -e 's/ (set.*$//')%{$fg[white]%}]%{$reset_color%}"
  fi
fi
 
function get_pwd() {
  echo "${PWD/$HOME/~}"
}
 
PROMPT=$J_CURRENT_RUBY_'%{$fg[red]%}[%{$fg[magenta]%}$(get_pwd)%{$fg[red]%}]%{$fg_bold[green]%}% %{$fg[cyan]%}%{$fg_bold[blue]%}[$(git_prompt_info)%{$fg_bold[blue]%}]%{$fg_bold[red]%} ➜ % %{$reset_color%}'
 
ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[yellow]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%} %{$fg[yellow]%}✗%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%}"
