# frozen_string_literal: true

source "https://rubygems.org"

# Specify your gem's dependencies in customerx_tracking.gemspec
gemspec
gem "rake"
gem "rubocop"

group :test do
  gem "simplecov"
  gem "byebug", :platform => [:ruby_20, :ruby_21]
  gem "webmock"
  gem "vcr", "~> 6.0"
  gem "rspec"
end

group :dev do
  gem "bump"
end
