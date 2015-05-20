class binarin::profile::user_binarin {
  ::binarin::profile::profile_sync_daemon::user { "binarin": }
  include ::binarin::profile::docker
  include ::binarin::profile::dropbox
  include ::binarin::profile::insync
  include ::binarin::profile::yandex_disk
  include ::binarin::profile::ack
  include ::binarin::profile::dpkg_dev

  $packages = [ "zsh", "tmux", "screen", "mosh", "mc",
                "build-essential", "rxvt-unicode-256color", "kupfer",
                "libkeybinder-dev", "wmctrl", "git-svn", "subversion",
                "pavucontrol", "xclip", "aosd-cat", "icedove", "offlineimap",
                "audacious", "keepass2", "sqlite3",
                "python3-pip", "python-pip", "maildir-utils", "python-sqlite",
                "mu4e", "darcs", "git", "npm", "nodejs", "nodejs-legacy",
                "python-virtualenv", "python-dev", "ldapscripts",
              ]

  ensure_packages($packages, {ensure => latest})
  ensure_packages(["IMAPClient"], {provider => pip, require => Package["python-pip"]})

  exec { "install imapclient library for python3":
    command => "/usr/bin/pip3 install IMAPClient",
    unless => "/usr/bin/python3 -m imapclient.imapclient",
    require => Package["python3-pip"],
  }

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
