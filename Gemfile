source 'https://rubygems.org'

# authentification
# gem 'devise'
# gem 'pundit'

gem 'bootstrap', '~> 4.0.0.alpha3'
gem 'coffee-rails'
gem 'devise'
gem 'jbuilder'
gem 'jquery-rails'
gem 'puma'
gem 'rails'
gem 'sass-rails'
gem 'turbolinks'
gem 'uglifier'
gem 'best_in_place', github: 'bernat/best_in_place'
gem 'devise-bootstrap-views', '~> 1.1'

group :development, :test do
  gem 'byebug', '9.0.6', platform: :mri
  gem 'database_cleaner'
  gem "factory_bot_rails"
  gem 'pry-byebug'
  gem 'pry-rails'
  gem 'rspec-rails'
  gem 'simplecov'
  gem 'sqlite3'
end

group :development do
  gem "better_errors"
  gem "binding_of_caller"
  gem 'letter_opener'
  gem 'listen'
  gem 'rubocop', '~> 0.58.1', require: false
  gem 'spring'
  gem 'spring-watcher-listen'
  gem 'web-console'
end

group :test do
  gem 'capybara'
  gem 'poltergeist'
  gem 'shoulda-matchers'
end

group :production do
  gem 'pg', '0.20.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
