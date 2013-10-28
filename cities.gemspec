# -*- encoding: utf-8 -*-
require File.expand_path('../lib/cities/version', __FILE__)

Gem::Specification.new do |s|
  s.name        = 'cities'
  s.version     = Cities::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ['Joe Corcoran']
  s.email       = ['joecorcoran@gmail.com']
  s.homepage    = 'http://github.com/joecorcoran/cities'
  s.summary     = 'World cities in Ruby'
  s.license     = 'MIT'
  s.description = <<-txt
Provides data about world cities in Ruby. Data from the Maxmind database. 
txt

  s.add_dependency             'multi_json',  '~> 1.8.2'

  s.add_development_dependency 'rspec',       '~> 2.14.1'
  s.add_development_dependency 'countries',   '~> 0.9.3'
  s.add_development_dependency 'rake'

  s.files        = Dir['lib/**/*.{rb,json}'] + ['README.md', 'LICENSE.txt']
  s.require_path = 'lib'
end
