# resources { "firewall":
#   purge => true
# }

node "naberius.binarin.ru" {
  Firewall {
    before  => Class['binarin::profile::firewall::post'],
    require => Class['binarin::profile::firewall::pre'],
  }

  include ::binarin::role::pve_public
}

node "ishamael.home.binarin.ru", "ishamael" {
  include ::binarin::role::workstation
}
node "demandred.yandex.net", "demandred" {
  include ::binarin::role::workstation
}
