
class ordering {

  stage { 'post-run': }

  Stage['main'] -> Stage['post-run']

  Package<| |> {
      require => Yumrepo['epel'],
  }

  class { 'ordering::epel': }
  class { 'ordering::mysql': }
  class { 'ordering::updatedb':
    stage => 'post-run',
  }

}
