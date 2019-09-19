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

# linux tools
alias ls="lsd -l --group-dirs=first"
alias cat="bat"
alias grep="rg"

# Chrome
how() {
  open -a "Google Chrome" "https://www.google.com/search?q=$1"
}
