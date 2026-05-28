# Maintainer: Prabakaran <prabakaranorganisation@gmail.com>
pkgname=bdh-linux
pkgver=4.2.0
pkgrel=1
pkgdesc="Backend developer environment provisioning CLI for Arch/Manjaro"
arch=('any')
url="https://github.com/BackendDeveloperHub/bdh-linux"
license=('MIT')
depends=('python' 'python-pipx')
source=("https://files.pythonhosted.org/packages/source/b/bdh-linux/bdh-linux-${pkgver}.tar.gz")
sha256sums=('SKIP')  # Replace with actual sha256

build() {
    cd "$srcdir/bdh-linux-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/bdh-linux-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1
}