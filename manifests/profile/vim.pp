class binarin::profile::vim {
  package { "vim":
    ensure => latest,
  } ->
  exec { "/usr/bin/update-alternatives --set editor /usr/bin/vim.basic":
    unless => "/usr/bin/update-alternatives --query editor | perl -nE 'say \$1 if /^Value: (.*)\$/' | grep '/usr/bin/vim.basic'"
  }
  package { "vim-puppet":
    ensure => latest
  }
# ->
  # exec { "/usr/bin/vim-addons -w install puppet": }

}
