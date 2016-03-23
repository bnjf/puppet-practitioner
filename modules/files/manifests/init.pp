
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

  files::motd { 'header':
    message => template('files/motd_header.erb'),
    order   => '01',
  }

  files::motd { 'body':
    content => "unauthorised use prohibited, etc\n",
    order   => '50',
  }

  files::motd { 'footer':
    content => template('files/motd_footer.erb'),
    order  => '99',
  }

}
