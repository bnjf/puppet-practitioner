#!/usr/bin/env ruby

File.open('/etc/krb5.conf') do |f1|
  while line = f1.gets
    if m = line.match('^\s*\bdefault_realm\b\s*=\s*(\S+)') then
      puts m[1]
    end
  end
end

