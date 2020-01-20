# frozen_string_literal: true

source 'https://rubygems.org'

# Specify your gem's dependencies in poc_github_ap.gemspec
gemspec

# gem 'sample_cmdlet_patterns', github: 'klueless-io/sample_cmdlet_patterns', branch: 'master'
gem 'sample_cmdlet_patterns', path: '/Users/davidcruwys/dev/cmdlets/sample_cmdlet_patterns' # path: '../sample_cmdlet_patterns'

group :development, :test do
  gem 'guard-rspec'
  # pry on steroids
  gem 'jazz_fingers'
  gem 'rake', '~> 12.0'
  # this is used for cmdlets 'self-executing gems'
  gem 'rake-compiler'
  gem 'rspec', '~> 3.0'
  gem 'rubocop'
end
