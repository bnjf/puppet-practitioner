#!/usr/bin/env ruby

module Puppet::Parser::Functions
  homedir(:username,
          :type => :rvalue,
          :arity => 1
         ) do |args|
           raise ArgumentError, 'Expects a string' unless args.first.class == String
           if username == "root" then
             return "/root"
           else
             return "/home/#{username}"
           end
         end
end

