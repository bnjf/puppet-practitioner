
class review(
  $user = 'review'
) {

  file { '/etc/shells':
    ensure => 'file',
    source => 'puppet:///modules/review/shells',
  }

  file { '/etc/motd':
    ensure  => 'file',
    content => template('review/motd.erb'),
  }

  user { $user:
    shell => '/bin/csh',
  }

}
