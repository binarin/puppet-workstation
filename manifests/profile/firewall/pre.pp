class binarin::profile::firewall::pre {
  Firewall {
    require => undef,
  }

  ensure_packages(["iptables-persistent"])

  firewallchain { 'INPUT:filter:IPv4':
    purge => true
  } ->
  firewallchain { 'OUTPUT:filter:IPv4':
    purge => true
  } ->
  firewallchain { 'FORWARD:filter:IPv4':
    purge => true,
    ignore => [
      '-j fail2ban-ssh', # ignore the fail2ban jump rule
      '--comment "[^"]*(?i:ignore)[^"]*"', # ignore any rules with "ignore" (case insensitive) in the comment in the rule
      '(?i:docker)',
    ],
  }->
  firewall { '000 accept all icmp':
    proto   => 'icmp',
    action  => 'accept',
  }->
  firewall { '001 accept all to lo interface':
    proto   => 'all',
    iniface => 'lo',
    action  => 'accept',
  }->
  firewall { '002 accept related established rules':
    proto   => 'all',
    ctstate => ['RELATED', 'ESTABLISHED'],
    action  => 'accept',
  }
}
