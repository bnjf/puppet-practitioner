

class system::dbadmins {
  require mysql::server

  # defaults
  Mysql_user {
    ensure => present,
    max_queries_per_hour => 600,
  }

  $users = {
    'monica@localhost' => { ensure => present, },
    'brad@localhost'   => { ensure => present, },
    'luke@localhost'   => { ensure => present, },
    'zack@localhost'   => { ensure => present, max_queries_per_hour => 1200, },
    'ralph@localhost'  => { ensure => absent, },
  }

  create_resources('mysql_user', $users)

}

