class binarin::profile::gnome {
  $packages = [ "gnome", "gnome-session-flashback", "lightdm", "xxkb", "kbdd" ]
  package { $packages:
    ensure => latest,
  } ->
  file { "/etc/X11/default-display-manager":
    ensure => present,
    content => "/usr/sbin/lightdm\n",
  } ->
  exec { "/usr/bin/dpkg-divert --divert /usr/lib/gnome-settings-daemon-3.0/libkeyboard.not-so --rename /usr/lib/gnome-settings-daemon-3.0/libkeyboard.so":
    unless => "/usr/bin/dpkg-divert --list | grep /usr/lib/gnome-settings-daemon-3.0/libkeyboard.so",
  }
}
