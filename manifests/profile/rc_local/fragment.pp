define binarin::profile::rc_local::fragment($content) {
  concat::fragment { "rc.local-${title}":
    target => "/etc/rc.local",
    order  => "50",
    content => "${content}\n",
  }
}
