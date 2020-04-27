source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.0'

gem 'rails', '~> 6.0.2', '>= 6.0.2.2' # Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'sqlite3', '~> 1.4'   # Use sqlite3 as the database for Active Record
gem 'puma', '~> 4.1'      # Use Puma as the app server
gem 'sass-rails', '>= 6'  # Use SCSS for stylesheets
gem 'webpacker', '~> 4.0' # Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
#gem 'bootstrap-sass'      # 4 BOOTSTRAP
#gem 'jquery-rails'        # 4 BOOTSTRAP
gem 'turbolinks', '~> 5'  # Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'jbuilder', '~> 2.7'  # Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder

gem 'bcrypt'              # Use Active Model has_secure_password
gem 'bootsnap', '>= 1.4.2', require: false # Reduces boot times through caching; required in config/boot.rb
gem 'hirb'                # for better view tables in console
gem 'faker'               # for better populate the db for test and view
gem 'will_paginate'       # for pagination usage

# gem 'redis', '~> 4.0'   # Use Redis adapter to run Action Cable in production
# gem 'image_processing', '~> 1.2' # Use Active Storage variant


group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw] # Call 'byebug' anywhere in the code to stop execution and get a debugger console
end

group :development do
  gem 'web-console', '>= 3.3.0' # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring-watcher-listen', '~> 2.0.0'
  # gem 'better_errors' # for better rails server error result
end

group :test do
  gem 'capybara', '>= 2.15' # Adds support for Capybara system testing and selenium driver
  gem 'selenium-webdriver'
  gem 'webdrivers'  # Easy installation and use of web drivers to run system tests with browsers
  gem 'minitest'    # for better testing results
  gem 'minitest-reporters'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]  # Windows does not include zoneinfo files, so bundle the tzinfo-data gem
