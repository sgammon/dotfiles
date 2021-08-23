#!/bin/bash

## 1: copy dotfiles sources
echo ""; echo "Copying dotfiles...";
mkdir -p ~/dotfiles;
cp -frv ./* ./.* ~/dotfiles/;

## 2: run `rcup`
echo ""; echo "--- Running 'rcup'...";
rcup;

## 3: copy in any secrets
echo ""; echo "--- Setting up credentials...";

if [[ -z "${GOOGLE_CREDENTIALS}" ]]; then
  mkdir -p "$HOME/.config/gcloud";
  echo "${GOOGLE_CREDENTIALS}" > "$HOME/.config/gcloud/application_default_credentials.json";
fi

if [[ -z "${BUILDBUDDY_CERT}" ]]; then
  echo "${BUILDBUDDY_CERT}" > "$HOME/buildbuddy-cert.pem";
fi

if [[ -z "${BUILDBUDDY_KEY}" ]]; then
  echo "${BUILDBUDDY_KEY}" > "$HOME/buildbuddy-key.pem";
fi
