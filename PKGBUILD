# Maintainer: Knut Ahlers <knut at ahlers dot me>

pkgname=vault-user-token
pkgver=0.5.0
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
sha512sums=('d0fcb8822035b26a8acf20c9ad8bf37917a66ec943446d2f18e1c0458f781b27553cab993184139ac913d41a1928b0db0b41db4974671d8d336d7f68506050d5'
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
