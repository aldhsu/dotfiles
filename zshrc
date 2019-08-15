#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Allen Hsu modified version of
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#
# zmodload zsh/zprof
# Source ZPlug
export ZPLUG_HOME=/usr/local/opt/zplug
source $ZPLUG_HOME/init.zsh

# OpenSSL
export OPENSSL_INCLUDE_DIR=`brew --prefix openssl`/include
export OPENSSL_LIB_DIR=`brew --prefix openssl`/lib
export PATH="/usr/local/opt/openssl/bin:$PATH"

# Plugins
zplug "lukechilds/zsh-nvm"

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi
# Source base16 256 colourspace script.
if [[ -s "$HOME/.colours/base16-shell/base16-tomorrow.dark.sh" ]]; then
  source "$HOME/.colours/base16-shell/base16-tomorrow.dark.sh"
fi

# iterm
source /Users/allen.hsu/.iterm2_shell_integration.zsh

#rails
alias be='bundle exec'
alias rdb='rake db:migrate && rake db:seed; bin/pspec setup'
alias reset_db='bundle check || bundle && brew services stop postgresql && brew services start postgresql && rake db:reset db:production:import && terminal-notifier -message "Database updated" -title "Terminal"'
alias s='spring'

# git
alias g='git'
alias gbr="git for-each-ref --sort='-committerdate' --format='%(refname)%09%(committerdate)' refs/heads | sed -e 's-refs/heads/--'"
alias gnb='git fetch && git checkout -q origin/master && git checkout -b'
alias gpnv='SKIP_HOOK_TESTS=1 git push'
alias gprunelocal='git branch --merged | grep -v "\*" | grep -v "master" | grep -v "develop" | grep -v "staging" | xargs -n 1 git branch -d'
alias grm='git fetch && git rebase origin/master'
alias gunwip="g reset head^"
alias gwip="g add . && g commit --m 'WIP'"

# tmux
alias a='tmux attach -t'
alias mux='tmuxinator'
alias t='tmux'
alias tk='tmux kill-session -t'

# emulation
alias an_emu="cd ~/Library/Android/sdk/tools && ANDROID_SDK_ROOT=~/Library/Android/sdk emulator @Pixel28.1"
alias ios_emu="open /Applications/Xcode.app/Contents/Developer/Applications/Simulator.app"

# postgres
alias kpg='rm /usr/local/var/postgres/postmaster.pid'
alias psql.server='pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log'
alias tail_pg_log='tail /usr/local/var/log/postgres.log'

# vim
alias v='NVIM_TUI_ENABLE_TRUE_COLOR=1 nvim'
alias vim='NVIM_TUI_ENABLE_TRUE_COLOR=1 nvim'

# regex
repl() { perl -pi -w -e "s/$1/$2/g;" * }
replr() { perl -p -i -e "s/$1/$2/g" `grep -ril $1 *` }

# shell
alias notify='terminal-notifier -message "Task Finished" -title "Terminal"'
killport() {  kill $( lsof -i:$1 -t ) }
rununtilfail() {
    count=0
    while eval $1; do (( count++ )); done; notify; echo $count
}

runmany() {
    success=0
    count=0
    total=$2
    while [ "$count" -lt "$total" ]
    do
        eval $1 && ((success++));
        ((count++))
        # echo $((count -le total))
    done
    notify; echo $success / $count
}

# direnv
if which direnv > /dev/null; then eval "$(direnv hook zsh)"; fi

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
