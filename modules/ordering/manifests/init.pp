
class ordering {

  stage { 'post-run': }

  Stage['main'] -> Stage['post-run']

  Package<| |> {
      require => Yumrepo['epel'],
  }

  # included later, out of order, to test the anchoring
  #class { 'ordering::epel': }
  #class { 'ordering::mysql': }

  notify { 'This should come after the entire MySQL class is enforced':
    require => Class['ordering::mysql'],
  }

  class { 'ordering::updatedb':
    stage => 'post-run',
  }

  include ordering::mysql
  include ordering::epel
}
