source 'https://rubygems.org'
ruby "2.4.1"

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.1.3'
# Use sqlite3 as the database for Active Record
gem 'sqlite3', group: [:development, :test]
gem "pg", group: :production
# Use Puma as the app server
gem 'puma', '~> 3.7', group: :production
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'
gem 'bcrypt', platforms: :ruby

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development
gem 'jquery-rails', '~> 4.3', '>= 4.3.1'
gem 'bootstrap-sass', '~> 3.3', '>= 3.3.7'
gem 'font-awesome-rails', '~> 4.7', '>= 4.7.0.2'

gem 'simple_form', '~> 3.5'
gem 'devise', '~> 4.3'
gem 'pundit', '~> 1.1'

gem 'carrierwave', '~> 1.1'
gem 'searchkick'

gem "rails_12factor", group: :production

gem 'active_model_serializers', '~> 0.10.6'

gem 'rb-fsevent', '~> 0.10.2'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  # Adds support for Capybara system testing
  gem 'rspec-rails', '~> 3.6', '>= 3.6.1'
end

group :test do
  gem "capybara", "~> 2.4"
  gem 'factory_girl_rails', '~> 4.8'
  gem 'selenium-webdriver', '~> 3.5.2', '>= 3.5.2'
  gem 'database_cleaner', '~> 1.6', '>= 1.6.1'
  gem 'email_spec'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
platform :mswin, :mingw, :x64_mingw do
  gem "tzinfo-data"
end