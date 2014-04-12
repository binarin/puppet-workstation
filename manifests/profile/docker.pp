class binarin::profile::docker {
  package { "docker.io": ensure => latest } ->
  group { "docker":
    ensure => present,
  } ->
  file { "/usr/bin/docker":
    ensure => link,
    target => "/usr/bin/docker.io",
  }
}
