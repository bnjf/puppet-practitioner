
class ordering::epel {

  yumrepo { 'epel':
    ensure              => 'present',
    descr               => 'Extra Packages for Enterprise Linux 6 - $basearch',
    enabled             => '1',
    failovermethod      => 'priority',
    gpgcheck            => '1',
    gpgkey              => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-6',
    mirrorlist          => 'https://mirrors.fedoraproject.org/mirrorlist?repo=epel-6&arch=$basearch',
    priority            => '99',
    skip_if_unavailable => '1',
  }

}

