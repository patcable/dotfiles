export OPSCODE_USER=cable
export GOPATH=$HOME/ts/golang
export EDITOR="code -w"
export PKCS11_PROVIDER=/usr/lib/ssh-keychain.dylib
export PATH="$HOME/bin:$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
DISABLE_UNTRACKED_FILES_DIRTY="true"
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
test -e "${HOME}/dotfiles-ts/env.bash" && source "${HOME}/dotfiles-ts/env.bash"
test -e "${HOME}/dotfiles-pers/env.bash" && source "${HOME}/dotfiles-pers/env.bash"