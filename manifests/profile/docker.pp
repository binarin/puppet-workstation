class binarin::profile::docker {
  ensure_packages(["docker.io"])

  Package["docker.io"] -> Group["docker"]
  group { "docker":
    ensure => present,
  }

  firewallchain { 'DOCKER:nat:IPv4':
    purge => false,
  }
}
