class binarin::profile::fonts {
  $packages = [ "xfonts-terminus" ]
  package { $packages: ensure => latest }
}
