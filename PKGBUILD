# Maintainer: Knut Ahlers <knut at ahlers dot me>

pkgname=vault-user-token
pkgver=0.6.2
pkgrel=1
pkgdesc="Constantly renew a Vault token derived from a role id"
arch=('i686' 'x86_64')
url="https://github.com/Luzifer/$pkgname"
license=('Apache')
makedepends=('go')
source=(
  "${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz"
  "vault-user-token.service"
)
sha512sums=('8009183ffcc28ea7362868536b0df866d71ca394fe706cb23eadfaa6c6c0acfec817257d64ea37a1059af91aaf4ae4776949866d7a9f885941c815a4cbd03071')

build() {
  export GO111MODULE=on
  export GOPATH="${srcdir}/go"

  cd "${srcdir}/${pkgname}-${pkgver}"

  go build -a -v \
    -ldflags="-s -w -X main.version=${pkgver}" \
    -mod=readonly \
    -o "${srcdir}/${pkgname}"

  go clean -modcache
}

package() {
  install -Dm755 "${srcdir}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "${srcdir}/vault-user-token.service" "${pkgdir}/usr/lib/systemd/user/vault-user-token.service"
}
