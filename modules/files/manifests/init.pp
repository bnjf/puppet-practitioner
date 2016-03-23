
class files {

  file { "/etc/cron.allow": ensure => file, }
  file { "/etc/cron.deny": ensure => file, }

  file_line { "cron.allow root":
    ensure => present,
    path   => '/etc/cron.allow',
    line   => 'root',
  }

  file_line { "cron.deny all":
    ensure => present,
    path   => '/etc/cron.deny',
    line   => '*',
  }



  $motd = "/etc/motd"
  concat { $motd:
    owner => 'root',
    group => 'root',
    mode  => '0644',
  }

  concat::fragment { 'motd header':
    target => $motd,
    content => template('files/motd_header.erb'),
    order  => '01',
  }

  concat::fragment { 'motd body':
    target  => $motd,
    content => "unauthorised use prohibited, etc\n",
    order   => '50',
  }

  concat::fragment { 'motd footer':
    target => $motd,
    content => template('files/motd_footer.erb'),
    order  => '99',
  }

}
