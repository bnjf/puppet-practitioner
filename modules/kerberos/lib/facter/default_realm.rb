#!/usr/bin/env ruby

Facter.add('default_realm') do
  setcode do
    File.open('/etc/krb5.conf') do |f1|
      while line = f1.gets
        if m = line.match('^\s*\bdefault_realm\b\s*=\s*(\S+)') then
          default_realm = m[1]
          break
        end
      end
    end
  end
end


