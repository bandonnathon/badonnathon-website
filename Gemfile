source 'https://rubygems.org'

gem 'rails'

gem 'haml'

# Needs to be outside of assets group because it’s needed in production
# Use a patched version with an updated r.js file
gem 'requirejs-rails', '0.9.0', :path => "vendor/gems/requirejs-rails-0.9.0"

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails'
  gem 'coffee-rails'
  gem 'haml_coffee_assets'
  gem 'execjs'
  gem 'uglifier'
end

gem "mongo_mapper"
gem "bson_ext"