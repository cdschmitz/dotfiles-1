#!/usr/bin/env bash

taps=(
    homebrew/cask
    homebrew/core
    shopify/shopify
    versent/homebrew-taps
)

formulas=(
    aws-iam-authenticator
    awscli
    bash
    coreutils
    fd
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

fi

# Update homebrew
echo "› brew update"
brew update

# Tap into additional repos as sources for formulas
for tap in "${taps[@]}"; do
    echo "Homebrew tap: $tap"
    brew tap $tap
done

brew install "${formulas[@]}"
exit 0
