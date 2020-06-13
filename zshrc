#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Allen Hsu modified version of
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#
# Uncomment to profile
# zmodload zsh/zprof 
# Source ZPlug
# export ZPLUG_HOME=/usr/local/opt/zplug
# source $ZPLUG_HOME/init.zsh
#
# # OpenSSL : brew wasn't linking openssl properly having doing this leads to +2s to the terminal load time
# export OPENSSL_INCLUDE_DIR=`brew --prefix openssl`/include
# export OPENSSL_LIB_DIR=`brew --prefix openssl`/lib
# export PATH="/usr/local/opt/openssl/bin:$PATH"
#
# # Plugins
#
# # Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.prezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.prezto/init.zsh"
fi
# # Source base16 256 colourspace script.
if [[ -s "$HOME/.colours/base16-shell/base16-tomorrow.dark.sh" ]]; then
  source "$HOME/.colours/base16-shell/base16-tomorrow.dark.sh"
fi
#
# # iterm
# source /Users/allen.hsu/.iterm2_shell_integration.zsh
#
# # linux tools
alias ls="lsd -l --group-dirs=first"
alias cat="bat"
alias grep="rg"
#
# source /Users/allen.hsu/Library/Preferences/org.dystroy.broot/launcher/bash/br

. /usr/local/opt/asdf/asdf.sh
# . /usr/local/opt/asdf/etc/bash_completion.d/asdf.bash
# zprof
