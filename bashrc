export OPSCODE_USER=cable
export GOPATH=$HOME/ts/golang
export EDITOR="code -w"
export PKCS11_PROVIDER=/usr/lib/ssh-keychain.dylib

export PATH="$HOME/bin:$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
if [ $TERM_PROGRAM != "Apple_Terminal" ]; then
  eval "$(posh init bash --config $HOME/.posh-themes/marcduiker.omp.json)"
fi

DISABLE_UNTRACKED_FILES_DIRTY="true"
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
test -e "${HOME}/dotfiles-ts/desktop-zshrc" && source "${HOME}/dotfiles-ts/desktop-zshrc"
test -e "${HOME}/src/dotfiles-pers/zshrc" && source "${HOME}/src/dotfiles-pers/zshrc"
test -e "/opt/homebrew/bin/brew" && eval "$(/opt/homebrew/bin/brew shellenv)"