class binarin::role::workstation inherits binarin::role {
  include ::binarin::profile::vim
  include ::binarin::profile::xorg
  include ::binarin::profile::keepass
  include ::binarin::profile::keyboard
  include ::binarin::profile::workrave
  include ::binarin::profile::gnome
  include ::binarin::profile::emacs
  include ::binarin::profile::chromium
  include ::binarin::profile::clementine
  include ::binarin::profile::openvpn
  include ::binarin::profile::cups
  include ::binarin::profile::sbcl
  include ::binarin::profile::xmonad
  include ::binarin::profile::hg
  include ::binarin::profile::zeal

  include ::binarin::profile::user_binarin
}
