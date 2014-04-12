class binarin::profile::emacs {
  include ::binarin::profile::fonts
  $packages = [ "emacs24", "emacs24-el" ]
  package { $packages: ensure => latest }
}
