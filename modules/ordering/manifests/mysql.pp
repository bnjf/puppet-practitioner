
class ordering::mysql {

  class { '::mysql::server':
    root_password           => 'strongpassword',
    remove_default_accounts => true,
  }

  class { '::mysql::bindings':
    php_enable  => true,
    perl_enable => true,
  }

}

