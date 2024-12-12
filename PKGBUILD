# Maintainer: Knut Ahlers <knut at ahlers dot me>

pkgname=vault-user-token
pkgver=0.5.3
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
sha512sums=('414f6f58af54165b652f858fe9b9a9724bdd0d4071e076c19247148f93e20abd6ab1840afed78b430e3817ec12a72471deb12d43a65f3d904b3725e8bf719291'
            '35e9d325f6ff4d3ec565dde297c0792b2ade3338a4d207e50979e465ec366865abb6d031971642e974d71ac4a16760a0ed90b71a37c7feff180d5336952de424')

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
