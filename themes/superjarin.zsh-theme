# Grab the current version of ruby in use (via RVM): [ruby-1.8.7]
if [ -e ~/.rvm/bin/rvm-prompt ]; then
  JARIN_CURRENT_RUBY_="%{$fg[white]%}[%{$fg[red]%}\$(~/.rvm/bin/rvm-prompt i v)%{$fg[white]%}]%{$reset_color%}"
else
  if which rbenv &> /dev/null; then
    JARIN_CURRENT_RUBY_="%{$fg[white]%}[%{$fg[red]%}\$(rbenv version | sed -e 's/ (set.*$//')%{$fg[white]%}]%{$reset_color%}"
  fi
fi


# Returns "*" if the current git branch is dirty.
function evil_git_dirty {
   [[ $(git diff --shortstat 2> /dev/null | tail -n1) != "" ]] && echo "*"
 }

function my_statement {
git-status="`git status | sed '/^\s*$/d' | wc -l`"
[(git status | sed '/^\s*$/d' | wc -l) > 0] && echo $git-status
}

# Grab the current filepath, use shortcuts: ~/Desktop
# Append the current git branch, if in a git repository
JARIN_CURRENT_LOCA_="%{$fg_bold[cyan]%}%~\$(git_prompt_info): $(my_statement)%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[white]%} <%{$fg[magenta]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$fg[white]%}>$(evil_git_dirty) "

# Do nothing if the branch is clean (no changes).
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[white]%}>"

# Add a yellow ✗ if the branch is dirty
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[white]%}> %{$fg[yellow]%}✗"

# Put it all together!
PROMPT="$JARIN_CURRENT_RUBY_ $JARIN_CURRENT_LOCA_ "

