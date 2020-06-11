# frozen_string_literal: true

source 'https://rubygems.org'

gemspec

gem 'rubocop-ast', github: 'marcandre/rubocop-ast', branch: 'nodepatternmatch'

local_gemfile = 'Gemfile.local'

if File.exist?(local_gemfile)
  eval(File.read(local_gemfile)) # rubocop:disable Security/Eval
end
