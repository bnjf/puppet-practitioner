
class ordering::mysql {

  class { '::mysql::server':
    root_password           => 'strongpassword',
    remove_default_accounts => true,
  }
  contain ::mysql::server

  class { '::mysql::bindings':
    php_enable  => true,
    perl_enable => true,
  }
  contain ::mysql::bindings

}

