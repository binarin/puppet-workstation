class binarin::profile::baseapps {
  $packages = ["vim", "tmux", "mosh", "zsh", "screen", "nmap", "strace", "tshark", "mc", "less", "ack-grep"]
  package { $packages: ensure => latest }
}
