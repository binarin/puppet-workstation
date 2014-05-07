resources { "firewall":
  purge => true
}

node "naberius.binarin.ru" {
  Firewall {
    before  => Class['binarin::profile::firewall::post'],
    require => Class['binarin::profile::firewall::pre'],
  }

  include ::binarin::role::pve_public
}
