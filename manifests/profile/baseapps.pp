class binarin::profile::baseapps {
  include ::binarin::profile::apt
  include ::binarin::profile::vim
  include ::binarin::profile::ack

  $packages = ["tmux", "mosh", "zsh", "screen", "nmap", "strace", "tshark", "mc", "less", "curl"]
  ensure_packages($packages, {ensure => latest})
}
