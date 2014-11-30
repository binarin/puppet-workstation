class binarin::profile::insync {
  include ::binarin::profile::python_gpgme
  $packages = ["insync"]
  apt::key { "ACCAF35C":
    ensure => present,
  } ->
  apt::source { "insync":
    location => 'http://apt.insynchq.com/debian',
    release => 'sid',
    repos => 'non-free',
    include_src => false,
  } ->
  package { $packages: ensure => latest }
}
