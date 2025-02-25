# frozen_string_literal: true

source 'https://rubygems.org'

ruby '3.3.4'
gem 'rails', '~> 6.1.7.10'

gem 'bootsnap', require: false
gem 'factory_bot_rails'
gem 'faker'
gem 'puma'
gem 'react-rails'
gem 'shakapacker'
gem 'sqlite3', '~> 1.4'
gem 'tzinfo'
gem 'tzinfo-data'

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'database_cleaner-active_record'
end

group :development do
  gem 'brakeman', require: false
  gem 'bundler-audit', require: false
  gem 'rubocop'
  gem 'rubocop-capybara'
  gem 'rubocop-factory_bot'
  gem 'rubocop-minitest'
  gem 'rubocop-performance'
end

group :test do
  gem 'capybara'
  gem 'minitest'
  gem 'minitest-reporters'
  gem 'selenium-webdriver'
end
