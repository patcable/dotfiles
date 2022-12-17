mkdir -p $HOME/bin

# if you update the version update the hash files.
POSH_VER=v12.26.6
POSH_OS=$(uname -s | tr '[:upper:]' '[:lower:]')
ARCH=$(uname -m)
case $(uname -m) in
    'x86_64')
        POSH_ARCH='amd64'
        ;;
    'aarch64')
        POSH_ARCH='arm64'
        ;;
    *)
        POSH_ARCH=$ARCH
        ;;
esac
POSH_FILE="posh-${POSH_OS}-${POSH_ARCH}"
curl --silent -LO https://github.com/JanDeDobbeleer/oh-my-posh/releases/download/${POSH_VER}/${POSH_FILE}
curl --silent -LO https://github.com/JanDeDobbeleer/oh-my-posh/releases/download/${POSH_VER}/themes.zip
DOWNLOAD_SUM=$(shasum -a 256 $POSH_FILE | cut -f1 -d ' '| tr '[:lower:]' '[:upper:]' | tr -d '\n')
STORE_SUM=$(cat posh-verify/$POSH_FILE.sha256)
if [[ "$DOWNLOAD_SUM" == "$STORE_SUM" ]]; then
  chmod +x $POSH_FILE
  mv $POSH_FILE $HOME/bin/posh
else
  echo "SHA256 Validation Failed. I'm out."
  exit 1
fi

mkdir $HOME/.posh-themes
unzip themes.zip -d $HOME/.posh-themes
rm themes.zip
chmod 0600 $HOME/.posh-themes/*

if [[ ${POSH_OS} == "darwin" ]]; then
    rm -rf ~/.zshrc ~/.zshenv
    ln -s $(pwd)/zshrc $HOME/.zshrc
    ln -s $(pwd)/zshenv $HOME/.zshenv
elif [[ ${POSH_OS} == "linux" ]]; then
    rm -rf ~/.bash_profile ~/.bashrc
    ln -s $(pwd)/bashrc $HOME/.bashrc
    ln -s $(pwd)/bash_profile $HOME/.bash_profile
else
    echo "assuming zsh for mac, bash for linux. whats the deal?"
fi
