class binarin::profile::fonts {
  $packages = [ "xfonts-terminus", "ttf-mscorefonts-installer" ]
  package { $packages: ensure => latest }
}
