# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.0.3'

gem 'bootsnap', require: false
gem 'pg', '~> 1.1'
gem 'puma', '~> 5.0'
gem 'rails', '~> 7.0.6'
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

gem 'rswag-api'
gem 'rswag-ui'
gem 'will_paginate'

group :development, :test do
  gem 'debug', platforms: %i[mri mingw x64_mingw]
  gem 'factory_bot_rails'
  gem 'pry-byebug'
  gem 'rubocop-rails', require: false
end
