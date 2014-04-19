class binarin::profile::proxmox {
  include ::binarin::profile::ip_forward

  class { 'dnsmasq':
    interface         => 'vmbr0',
  }

  concat::fragment { "dnsmasq-bind-interfaces":
    order   => '01',
    target  => $dnsmasq::params::dnsmasq_conffile,
    content => "bind-interfaces\n",
  }

  dnsmasq::dhcp { 'dhcp':
    dhcp_start => regsubst($::ipaddress_vmbr0,'^(\d+\.\d+\.\d+)\.(\d+)$','\1.100'),
    dhcp_end   => regsubst($::ipaddress_vmbr0,'^(\d+\.\d+\.\d+)\.(\d+)$','\1.200'),
    netmask    => $::netmask_vmbr0,
    lease_time => '10m'
  }

  firewall { '100 proxmox web ui':
    proto => 'tcp',
    dport => [8006, 5900],
    action => 'accept',
  }

  firewall { '100 snat for vmbr0':
    chain    => 'POSTROUTING',
    jump     => 'MASQUERADE',
    proto    => 'all',
    outiface => "eth0",
    source   => "$::network_vmbr0/$::netmask_vmbr0",
    table    => 'nat',
  }

  firewall { '100 forward for vmbr0 - out':
    chain => 'FORWARD',
    iniface => 'vmbr0',
    outiface => 'eth0',
    action => 'accept',
  }

  firewall { '100 forward for vmbr0 - in':
    chain => 'FORWARD',
    outiface => 'vmbr0',
    iniface => 'eth0',
    action => 'accept',
  }

  firewall { '100 accept dns requests from vmbr0 - tcp':
    iniface => 'vmbr0',
    proto => 'tcp',
    dport => 53,
    action => 'accept',
  }

  firewall { '100 accept dns requests from vmbr0 - udp':
    iniface => 'vmbr0',
    proto => 'udp',
    dport => 53,
    action => 'accept',
  }

  firewall { '100 accept dhcp requests from vmbr0':
    iniface => 'vmbr0',
    proto => 'udp',
    dport => [67, 68],
    action => 'accept',
  }
}
