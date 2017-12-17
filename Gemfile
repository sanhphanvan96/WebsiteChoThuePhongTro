source "https://rubygems.org"

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

# Gem for upload mutil attachments
gem "carrierwave", "~> 1.0"
gem "file_validators"
gem "mini_magick"

gem "bcrypt", "~> 3.1.7"
gem "bootstrap-sass", "3.3.7"
gem "carrierwave", "~> 1.0"
gem "coffee-rails", "~> 4.2"
gem "config"
gem "devise"
gem "faker", "1.6.6"
gem "file_validators"
gem "font-awesome-rails"
gem "jbuilder", "~> 2.5"
gem "jquery-rails"
gem "mini_magick"
gem "mysql2"
gem "puma", "~> 3.7"
gem "rails", "~> 5.1.4"
gem "sass-rails", "~> 5.0"
gem "turbolinks", "~> 5"
gem "uglifier", ">= 1.3.0"
gem 'will_paginate'

gem 'remotipart', github: 'mshibuya/remotipart'
gem 'rails_admin', github: 'sferik/rails_admin'
gem 'rails_admin_rollincode', '~> 1.0'


group :development, :test do
  gem "byebug", platforms: [:mri, :mingw, :x64_mingw]
  gem "pry-rails"
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem "web-console", ">= 3.3.0"
  gem "listen", ">= 3.0.5", "< 3.2"
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]
