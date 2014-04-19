class binarin::profile::firewall::post {
  Firewall {
    before  => undef,
  }

  firewall { '900 allow all ssh':
    proto   => 'tcp',
    dport    => 22,
    action  => 'accept',
  }->
  firewall { '999 disable other input':
    action => 'drop',
  }
}
