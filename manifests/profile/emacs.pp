class binarin::profile::emacs {
  include ::binarin::profile::fonts
  $packages = [ "emacs24", "emacs24-el" ]
  package { $packages: ensure => latest }

  # # for building emacs from sources
  # ensure_packages(
  #   [ "libxpm-dev", "libjpeg8-dev", "libgif-dev", "libtiff4-dev", "libncurses5-dev", "librsvg2-dev", "libmagick++-dev",
  #     "libgpm-dev", "libdbus-1-dev", "libgnutls-dev", "libxml2-dev", "libotf-dev", "ruby-dev",
  #     "autoconf", "automake"
  #     ]
  # )
  # ensure_packages(["fpm"], {provider => gem, require => Package["ruby-dev"]})

  ensure_packages(["gnutls-bin"]) # for jabber.el
}
