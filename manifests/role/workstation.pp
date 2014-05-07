class binarin::role::workstation {
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

  include ::binarin::profile::user_binarin
}
