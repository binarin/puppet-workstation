class binarin::profile::rc_local {
  concat { "/etc/rc.local":
    mode => '0755',
  }
  concat::fragment { "rc.local-header":
    target => "/etc/rc.local",
    order  => "00",
    content => "# AUTOGENERATED, DO NOT TOUCH\n"
  }
  concat::fragment { "rc.local-footer":
    target => "/etc/rc.local",
    order  => "99",
    content => "exit 0\n"
  }
}
