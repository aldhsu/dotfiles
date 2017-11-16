#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source ZPlug
export ZPLUG_HOME=/usr/local/opt/zplug
source $ZPLUG_HOME/init.zsh

# OpenSSL
export OPENSSL_INCLUDE_DIR=`brew --prefix openssl`/include
export OPENSSL_LIB_DIR=`brew --prefix openssl`/lib

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

# Load direnv
if which direnv > /dev/null; then eval "$(direnv hook zsh)"; fi

# Setup docker environment variables docker-machine
# if which docker-machine > /dev/null; then
#   eval "$(docker-machine env dev)";
# fi
#

#functions
# startcity()
# {
#     osascript &>/dev/null <<EOF
#     tell application "iTerm 2"
#         tell current window
#             tell current tab
#                 tell current session
#                     write text "mux start city-data"
#                 end tell
#             end tell
#
#             set newTab to (create tab with default profile)
#             tell current tab
#                 tell current session
#                     write text "mux start city-web"
#                 end tell
#             end tell
#
#             set newTab to (create tab with default profile)
#             tell current tab
#                 tell current session
#                     write text "mux start bouncer"
#                 end tell
#             end tell
#         end tell
#     end tell
# EOF
# }
#
# startintegrated()
# {
#     osascript &>/dev/null <<EOF
#     tell application "iTerm 2"
#         tell current window
#             tell current tab
#                 tell current session
#                     write text "mux start integrated-data"
#                 end tell
#             end tell
#
#             set newTab to (create tab with default profile)
#             tell current tab
#                 tell current session
#                     write text "mux start integrated-web"
#                 end tell
#             end tell
#         end tell
#     end tell
# EOF
# }

# Aliases

# unalias gb

alias a='tmux attach -t'
alias g='git'
alias v='NVIM_TUI_ENABLE_TRUE_COLOR=1 nvim'
alias vim='NVIM_TUI_ENABLE_TRUE_COLOR=1 nvim'
alias t='tmux'
alias z='zeus'
alias s='spring'
alias be='bundle exec'
alias psql.server='pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log'
alias gpnv='SKIP_HOOK_TESTS=1 git push'
alias tk='tmux kill-session -t'
alias kpg='rm /usr/local/var/postgres/postmaster.pid'
alias rdb='rake db:migrate && rake db:seed; bin/pspec setup'
alias resetdb= 'rake db:reset db:migrate db:dummies:load'
alias emberupdate='bower cache clean && npm cache clean && rm -rf bower_components node_modules dist tmp && bower install && npm install'
alias lsaws-s='cd ~/Code/chef-repo/ && rake aws:instances && cd -'
alias lsaws-p='cd ~/Code/chef-repo/ && ENVIRONMENT=production rake aws:instances  && cd -'
alias gprunelocal='git branch --merged | grep -v "\*" | grep -v "master" | grep -v "develop" | grep -v "staging" | xargs -n 1 git branch -d'
alias mux='tmuxinator'
alias an_emu="cd ~/Library/Android/sdk/tools && ANDROID_SDK_ROOT=~/Library/Android/sdk emulator @NexusGooglePlay"
repl() { perl -pi -w -e "s/$1/$2/g;" * }
replr() { perl -p -i -e "s/$1/$2/g" `grep -ril $1 *` }
killport() {  kill $( lsof -i:$1 -t ) }

if which direnv > /dev/null; then eval "$(direnv hook zsh)"; fi
source /Users/allen.hsu/.iterm2_shell_integration.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export PATH="/usr/local/opt/openssl/bin:$PATH"
