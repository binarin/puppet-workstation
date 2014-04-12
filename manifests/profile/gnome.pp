class binarin::profile::gnome {
  package { "gnome":
    ensure => latest,
  } ->
  file { "/etc/X11/default-display-manager":
    ensure => present,
    content => "/usr/sbin/lightdm\n",
  }
}
