class binarin::profile::user_binarin {
  ::binarin::profile::profile_sync_daemon::user { "binarin": }
  include ::binarin::profile::docker
  include ::binarin::profile::dropbox
  include ::binarin::profile::ack

  $packages = [ "zsh", "tmux", "screen", "mosh", "mc",
                "build-essential", "rxvt-unicode-256color", "kupfer",
                "libkeybinder-dev", "wmctrl", "git-svn", "subversion",
                "pavucontrol", "xclip", "aosd-cat", "audacious"]

  ensure_packages($packages, {ensure => latest})

  Package["zsh"] -> User["binarin"]
  Group["docker"] -> User["binarin"]

  user { "binarin":
    ensure => present,
    groups => [ "cdrom", "floppy", "sudo", "audio", "dip", "video",
                "plugdev", "netdev", "scanner", "bluetooth", "lpadmin",
                "docker" ],
    home => "/home/binarin",
    shell => "/bin/zsh",
  }
}
