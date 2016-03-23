#!/usr/bin/env ruby

module Puppet::Parser::Functions
  newfunction(:homedir,
          :type => :rvalue,
          :arity => 1
         ) do |args|
           raise ArgumentError, 'Expects a string' unless args.first.class == String
           username = args.first
           if username == "root" then
             return "/root"
           else
             return "/home/#{username}"
           end
         end
end

