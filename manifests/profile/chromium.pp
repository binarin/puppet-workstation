class binarin::profile::chromium {
  include ::binarin::profile::profile_sync_daemon

  package { "chromium": ensure => latest }
}
