export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}


export PS1="🍔  \[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\$(parse_git_branch)\[\033[m\] $ "
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad
alias ls='ls -GFh'
alias alertsbanner='~/release_tools/alertsbanner/releases/darwin_alertsbanner'
alias prune_branches="echo 'deleting merged branches'; git branch --list --merged | grep --invert-match --extended-regexp '\*|master' | xargs -n 1 git branch -d"
alias chivpn='~/nr-osa-chi-vpn-connect/bin/connect'
alias JS='osascript -l JavaScript -i'
# startup virtualenv-burrito
if [ -f $HOME/.venvburrito/startup.sh ]; then
    . $HOME/.venvburrito/startup.sh
fi
export PATH="/usr/local/sbin:$PATH"

export DYLD_LIBRARY_PATH=/usr/local/mysql/lib:$DYLD_LIBRARY_PATH
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm

cd_with_node_npm_versions() {
  cd "$@";
  [ -n "$(nvm_find_nvmrc)" ] && nvm use;
  osascript -l JavaScript -e 'function run(){const T=Application("Terminal");const C=Application.currentApplication();C.includeStandardAdditions=true;T.windows[0].tabs[0].customTitle=C.doShellScript("echo \"node:\"$(node -v)\";npm:\"$(npm -v)");}'
}
alias cd="cd_with_node_npm_versions"
