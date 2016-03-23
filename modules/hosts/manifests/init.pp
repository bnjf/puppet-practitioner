class hosts {

  resources { 'host':
    purge => true,
  }

  @@host { $::hostname:
    ip           => $::ipaddress,
    host_aliases => $::fqdn,
    tag          => 'classroom',
  }

  Host <<| tag == 'classroom' |>>

}
