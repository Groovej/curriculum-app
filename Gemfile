source "https://rubygems.org"

ruby "3.2.1"

gem "rails", "~> 7.1.2"
gem "pg", "~> 1.1"
gem "sprockets-rails"
gem "puma", ">= 5.0"
gem "importmap-rails"
gem "turbo-rails"
gem "stimulus-rails"
gem "jbuilder"
gem "redis", ">= 4.0.1"
gem "bcrypt", "~> 3.1.7"
gem "tzinfo-data", platforms: %i[ windows jruby ]
gem "bootsnap", require: false
gem "validates_timeliness", "~> 7.0.0.beta1"
gem "wicked_pdf"
gem "wkhtmltopdf-binary"
gem "wkhtmltopdf-binary-edge"

group :development, :test do
  gem "debug", platforms: %i[ mri windows ]
  gem 'factory_bot_rails', '6.2.0'
  gem 'faker', '2.23.0'
  gem 'rspec-rails', '6.0.1'
  gem 'shoulda-matchers', '4.5.1', require: false

  gem 'byebug'
end

group :development do
  gem "web-console"
  gem "pry-rails"
  gem "pry-nav"
end

group :test do
  gem "rspec"
  gem "capybara"
  gem "selenium-webdriver"
end
