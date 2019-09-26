#
# Defines environment variables.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Ensure that a non-login, non-interactive shell has a defined environment.
if [[ "$SHLVL" -eq 1 && ! -o LOGIN && -s "${ZDOTDIR:-$HOME}/.zprofile" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprofile"
fi

#rails
alias be='bundle exec'
alias rdb='rake db:migrate && rake db:seed; bin/pspec setup'
alias reset_db='bundle check || bundle && brew services stop postgresql && brew services start postgresql && rake db:reset db:production:import && terminal-notifier -message "Database updated" -title "Terminal"'
alias s='spring'

# git
alias g='git'
alias gnb='git fetch && git checkout -q origin/master && git checkout -b'
alias gpnv='SKIP_HOOK_TESTS=1 git push'
alias gprunelocal='git branch --merged | grep -v "\*" | grep -v "master" | grep -v "develop" | grep -v "staging" | xargs -n 1 git branch -d'
alias grm='SKIP_HOOKUP=true git co master && gfr && g co - && g rebase master'
alias gunwip="g reset head^"
alias gwip="g add . && g commit --m 'WIP'"

# tmux
alias a='tmux attach -t'
alias mux='tmuxinator'
alias t='tmux'
alias tk='tmux kill-session -t'
alias tks='tmux kill-server'

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
fbr() {
  local branches branch
  branches=$(git for-each-ref --count=30 --sort=-committerdate refs/heads/ --format="%(refname:short) #%(committerdate)") &&
  branch=$(echo "$branches" |
           fzf-tmux -d $(( 2 + $(wc -l <<< "$branches") )) +m) &&
  git checkout $(echo "$branch" | sed "s/ #[MTWFS].*$//" | sed "s/.* //" | sed "s#remotes/[^/]*/##")
}

# Chrome
how() {
  open -a "Google Chrome" "https://www.google.com/search?q=$1"
}

# skim
export SKIM_DEFAULT_OPTIONS="--tiebreak=score,length"
