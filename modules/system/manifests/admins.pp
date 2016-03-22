
class system::admins {

  @user { 'bob':
    ensure => present,
    tag    => [ 'wordpress', ],
  }

  @user { 'sally':
    ensure => present,
    tag    => [ 'wordpress', ],
  }

  @user { 'joe':
    ensure => present,
    tag    => [ 'oracle', ],
  }

  @user { 'admin':
    ensure => present,
    #tag => [],
  }

}
