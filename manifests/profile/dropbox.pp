class binarin::profile::dropbox {
  include ::binarin::profile::python_gpgme
  apt::key { "5044912E":
    ensure => present,
    key_server => "pgp.mit.edu",
  } ->
  apt::source { "dropbox":
    location => 'http://linux.dropbox.com/debian',
    release => 'sid',
    repos => 'main',
    include_src => true,
  } ->
  package { "dropbox": ensure => latest }
}
