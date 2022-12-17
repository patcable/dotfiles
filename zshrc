export PATH="$HOME/bin:$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
if [ $TERM_PROGRAM != "Apple_Terminal" ]; then
  eval "$(posh init zsh --config $HOME/.posh-themes/marcduiker.omp.json)"
fi

DISABLE_UNTRACKED_FILES_DIRTY="true"
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
test -e "${HOME}/dotfiles-ts/desktop-zshrc" && source "${HOME}/dotfiles-ts/desktop-zshrc"
test -e "${HOME}/src/dotfiles-pers/zshrc" && source "${HOME}/src/dotfiles-pers/zshrc"
test -e "/opt/homebrew/bin/brew" && eval "$(/opt/homebrew/bin/brew shellenv)"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
