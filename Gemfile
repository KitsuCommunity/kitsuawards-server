# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '~> 3.0'

gem 'bcrypt', '~> 3.1', '>= 3.1.18'
gem 'bootsnap', '~> 1.15', require: false
gem 'dalli', '~> 3.2', '>= 3.2.3'
gem 'graphql', '~> 2.0', '>= 2.0.16'
gem 'oj', '~> 3.13', '>= 3.13.23'
gem 'pg', '~> 1.4', '>= 1.4.5'
gem 'puma', '~> 6.0', '>= 6.0.1'
gem 'rack-cors', '~> 1.1', '>= 1.1.1'
gem 'rails', '~> 7.0', '>= 7.0.4'
gem 'rails_admin', '~> 3.1', '>= 3.1.1'
gem 'rest-client', '~> 2.1'
gem 'sassc-rails', '~> 2.1', '>= 2.1.2'
gem 'sidekiq', '~> 7.0', '>= 7.0.2'

group :development, :test do
  gem 'debug', '~> 1.7', '>= 1.7.1', platforms: %i[mri mingw x64_mingw]
  gem 'rspec_junit_formatter', '~> 0.6.0'
  gem 'rspec-rails', '~> 6.0', '>= 6.0.1'
  gem 'rubocop', '~> 1.41', '>= 1.41.1', require: false
  gem 'rubocop-rails', '~> 2.17', '>= 2.17.4', require: false
  gem 'rubocop-rspec', '~> 2.16', require: false
  gem 'solargraph', '~> 0.48.0', require: false
end

group :development do
  gem 'annotate', '~> 3.2'
  gem 'better_errors', '~> 2.9', '>= 2.9.1'
  gem 'binding_of_caller', '~> 1.0'
  gem 'brakeman', '~> 5.4'
end

group :production do
  gem 'lograge', '~> 0.12.0'
end
