TERMUX_PKG_HOMEPAGE=https://github.com/dalance/procs
TERMUX_PKG_DESCRIPTION="A modern replacement for ps"
TERMUX_PKG_LICENSE="MIT"
TERMUX_PKG_MAINTAINER="@termux"
TERMUX_PKG_VERSION="0.12.2"
TERMUX_PKG_SRCURL=https://github.com/dalance/procs/archive/refs/tags/v${TERMUX_PKG_VERSION}.tar.gz
TERMUX_PKG_SHA256=14be8440fe85dc46e544a3f7e89b887db455a61db981d5f75b91fd89b366d84f
TERMUX_PKG_BUILD_IN_SRC=true
TERMUX_PKG_AUTO_UPDATE=true

# This package contains makefiles to run the tests. So, we need to override build steps.
termux_step_make() {
	termux_setup_rust
	cargo build --jobs $TERMUX_MAKE_PROCESSES --target $CARGO_TARGET_NAME --release
}

termux_step_make_install() {
	install -Dm700 -t $TERMUX_PREFIX/bin target/${CARGO_TARGET_NAME}/release/procs
}
