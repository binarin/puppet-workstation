define binarin::profile::profile_sync_daemon::user() {
  concat::fragment { "profile-sync-daemon: user $title":
    content => " $title ",
    target => "/etc/psd.conf",
    order => "50",
  }
}
