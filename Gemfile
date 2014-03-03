source 'https://rubygems.org'

gem 'rails', '3.2.13'
# Remove this when Rails is upgraded & requires rack >= 1.4.5 or >= 1.5.2
gem 'rack', '~> 1.4.5'
# Remove this when Rails is upgraded & requires json >= 1.7.7
gem 'json', '~> 1.7.7'

gem 'activeadmin', git: 'git://github.com/gregbell/active_admin.git'
gem 'meta_search', '>= 1.1.0.pre'
gem 'carrierwave'
gem 'floodgate'
gem 'fog'
gem 'mini_magick'
gem 'idkfa'
gem 'pg'
gem 'validates_timeliness'
gem 'haml'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails'
  gem 'coffee-rails', '~> 3.2.1'

  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'

group :development do
  gem 'thin'
  gem 'faker'
end

group :test, :development do
  gem 'rspec-rails'
  gem 'turnip'
  gem 'capybara'
  gem 'pry-rails'
  gem 'launchy'
end

group :production do
  gem 'unicorn'
end
