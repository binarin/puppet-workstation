class binarin::profile::keyboard {
  file { "/etc/default/keyboard":
    ensure => present,
    replace => true,
    content => '
XKBMODEL="pc105"
XKBLAYOUT="us,ru"
XKBVARIANT="dvp,dvp"
XKBOPTIONS="grp:menu_toggle,ctrl:nocaps,altwin:super_win,grp:sclk_toggle"

BACKSPACE="guess"
'} ~>
  exec  { "/usr/sbin/dpkg-reconfigure keyboard-configuration":
    refreshonly => true,
    environment => "DEBIAN_FRONTEND=noninteractive",
  }



}
