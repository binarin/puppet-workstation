class binarin::profile::yandex_disk {
  include ::binarin::profile::python_gpgme

  apt::key { "7C90E5AF":
    ensure => present,
  } ->
  apt::source { "yandex_disk":
    location => 'http://repo.yandex.ru/yandex-disk/deb/',
    release => 'stable',
    repos => 'main',
    include_src => false,
  } ->
  package { "yandex-disk": ensure => latest }
}
