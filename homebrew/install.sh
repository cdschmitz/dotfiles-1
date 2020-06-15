#!/bin/sh

taps=(
    homebrew/cask
    homebrew/core
    shopify/shopify
    versent/taps
)

formulas=(
    aws-iam-authenticator
    awscli
    bash
    coreutils
    fzf
    jq
    hyperkit
    kubectl
    kubectx
    node
    openssl
    pyenv
    readline
    ripgrep
    saml2aws
    tfenv
    toxiproxy
    zsh
)

if test ! $(which brew)
then
  echo "  Installing Homebrew for you."

  # Install the correct homebrew for each OS type
  if test "$(uname)" = "Darwin"
  then
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  elif test "$(expr substr $(uname -s) 1 5)" = "Linux"
  then
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install)"
  fi

  # Tap into additional repos as sources for formulas
  for tap in $taps; do
      brew tap $tap
  done
fi

brew install "${formulas[@]}"

exit 0
