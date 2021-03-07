# frozen_string_literal: true

source 'https://rubygems.org'
# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '5.0.0'
# Use Puma as the app server
gem 'puma', '3.4.0'
# Use SCSS for stylesheets
gem 'sass-rails', '5.0.6'
# Use Uglifier as compressor for JavaScript assets
gem 'font-awesome-sass', '4.6.2'
gem 'uglifier', '3.0.0'
# Use CoffeeScript for .coffee assets and views
gem 'bootstrap-sass', '3.3.7'
gem 'coffee-rails', '4.2.1'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby
# Use jquery as the JavaScript library
gem 'jquery-rails', '4.1.1'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '5.0.0'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'devise', '4.2.0'
gem 'jbuilder', '2.5.0'
gem 'paperclip', '4.3.6'
gem 'progress_bar', '1.3.1'
gem 'select2-rails'
gem 'sunspot_rails'
gem 'sunspot_solr' # optional pre-packaged Solr distribution for use in development. Not for use in production.
gem 'elasticsearch', '6.3.0'
gem 'chewy', '5.0.0'
gem 'swot', '1.0'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '3.1.7'
# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development
group :development, :test do
  # Use sqlite3 as the database for Active Record
  gem 'sqlite3', '1.3.13'
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platform: :mri
  # testing framework
  gem 'rspec-rails', '~> 3.0'
  # database for testing
  gem 'factory_bot_rails'
  # chatroom controller testing
  gem 'rails-controller-testing'
end
group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'listen', '3.0.5'
  gem 'web-console'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '2.0.0'
end
group :production do
  # Use the PostgreSQL gem for Heroku production servers
  gem 'pg', '0.18.4'
end
# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
ruby '2.3.0'
