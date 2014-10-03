class binarin::profile::profile_sync_daemon
{
  include ::apt
  apt::key { "FF7F9516":
    ensure => present,
  } ->
  apt::key { "C1C5C63BF0E0B4E7":
    ensure => present,
    key_server => "wwwkeys.pgp.net",
  } ->
  apt::source { "profile-sync-daemon":
    location => 'http://ppa.launchpad.net/graysky/utils/ubuntu',
    release => 'trusty',
    repos => 'main',
  } ->
  package { "profile-sync-daemon": ensure => latest, } ->

  concat { "/etc/psd.conf":
    ensure_newline => false,
  }

  concat::fragment { "/etc/psd.conf header":
    target => "/etc/psd.conf",
    ensure => present,
    order => "00",
    content => '
VOLATILE="/run/shm"
DAEMON_FILE="/var/run/psd"
USERS="
'
  }

  concat::fragment { "/etc/psd.conf footer":
    target => "/etc/psd.conf",
    ensure => present,
    order => "99",
    content => '"',
  }
}
