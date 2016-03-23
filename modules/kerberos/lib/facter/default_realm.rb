#!/usr/bin/env ruby

Facter.add('default_realm') do
  setcode do
    default_realm = nil
    File.open('/etc/krb5.conf') do |f1|
      while line = f1.gets
        # break on first match
        if m = line.match('^\s*\bdefault_realm\b\s*=\s*(\S+)') then
          default_realm = m[1]
          break
        end
      end
    end
    # return default_realm
    default_realm
  end
end


