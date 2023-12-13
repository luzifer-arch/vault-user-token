#!/bin/bash
set -euxo pipefail

# Read pkg name
PKG=$(awk -F '=' '/pkgname=/{ print $2 }' PKGBUILD)

# Get latest version
VER=$(curl -sSfL "https://lv.luzifer.io/v1/catalog/vault-user-token/latest/version")

# Insert latest version into PKGBUILD
sed -i \
  -e "s/^pkgver=.*/pkgver=${VER}/" \
  PKGBUILD

# Check whether this changed anything
if (git diff --exit-code PKGBUILD); then
  echo "Package ${PKG} has most recent version ${VER}"
  exit 0
fi

# Reset pkgrel
sed -i \
  -e 's/pkgrel=.*/pkgrel=1/' \
  PKGBUILD

# Update source hashes
updpkgsums

# Commit changes
git add PKGBUILD
git commit -m "${PKG} v${VER}"
