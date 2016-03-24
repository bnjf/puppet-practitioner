
require 'spec_helper'

describe('apache', :type => :class) do
  let(:node) { 'testhost.example.com' }
  let(:facts) do
    { :operatingsystem => 'RedHat' }
  end

  # - A package resource titled 'apache' that manages the appropriate package.
  describe 'a package is installed' do
    it {
      should contain_package('apache')
        .with_ensure('present')
    }
  end

  # - A file resource titled 'apache_config' that manages the proper path, with
  # the correct contents or source.
  describe 'a file resource is correct' do
    it {
      should contain_file('apache_config')
        .with_path('/etc/httpd/conf/httpd.conf')
        .with_source("puppet:///modules/apache/#{facts[:operatingsystem]}.conf")
    }
  end

  # - A service resource titled 'apache' that manages the proper service
  describe 'a service is correct' do
    it {
      should contain_service('apache')
        .with_enable(true)
        .with_ensure('running')
    }
  end

end

