source 'https://rubygems.org'
ruby '2.2.3'

gem 'rake'
gem 'activerecord', '>= 3.1', :require => 'active_record'
gem 'sqlite3'
gem 'padrino', '0.13.0'
gem 'email_validator'

group :development do
  gem 'rubocop', :require => false
  gem 'pry-byebug'
end

group :test do
  gem 'rack-test', :require => 'rack/test'
  gem 'shoulda-matchers', '~> 3.0'
  gem 'rspec'
  gem 'factory_girl'
  gem 'faker'
  gem 'database_cleaner'
  gem 'simplecov', :require => false
end
