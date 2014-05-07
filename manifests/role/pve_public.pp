class binarin::role::pve_public inherits binarin::role {
  include ::binarin::profile::proxmox

  dnsmasq::dhcpstatic { 'loyal-vc':
    mac => '92:DF:A9:D7:4E:00',
    ip  => '172.25.15.2',
  }

  firewall { "100 send traffic to loyal-vc":
    chain    => 'PREROUTING',
    jump     => 'DNAT',
    proto    => 'tcp',
    destination => $::ipaddress_eth0,
    dport    => [40080, 40022],
    todest   => '172.25.15.2',
    iniface => "eth0",
    table    => 'nat',
  }
}
