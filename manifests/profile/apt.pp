class binarin::profile::apt {
  class { '::apt':
    apt_update_frequency => 'daily',
  }
}
