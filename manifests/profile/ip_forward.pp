class binarin::profile::ip_forward {
  sysctl { 'net.ipv4.ip_forward': value => '1' }

  firewall { '999 disable other forwarding':
    chain  => 'FORWARD',
    action => 'drop',
  }
}
