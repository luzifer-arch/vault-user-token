# Maintainer: Knut Ahlers <knut at ahlers dot me>

pkgname=vault-user-token
pkgver=0.5.2
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
sha512sums=('0521b4ef0b4f8aa0782a2c8b69d818f767c9a8de9094d204e5838ab90c4c846f8c5a4ac1579cd21f42e56ca602870d35f7e2b0ed2fe788d507b04592cbfa274b'
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
