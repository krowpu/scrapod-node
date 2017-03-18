# frozen_string_literal: true

source 'https://rubygems.org'

git_source :krowpu do |repo_name|
  "https://github.com/krowpu/#{repo_name}.git"
end

# A ruby web server built for concurrency.
gem 'puma'

# Sinatra is a DSL for quickly creating web applications in Ruby with minimal effort.
gem 'sinatra', '>= 2.0.0.rc1', '< 3.0'

# Collection of useful Sinatra extensions.
gem 'sinatra-contrib', '>= 2.0.0.rc1', '< 3.0'

# A Ruby client library for Redis.
gem 'redis'

# Long-living Capybara Webkit process for web scraping.
gem 'capybara-webkit-daemon', krowpu: 'scrapod-server'

group :development do
  # A make-like build utility for Ruby.
  gem 'rake', require: false

  # Automatic Ruby code style checking tool.
  # Aims to enforce the community-driven Ruby Style Guide.
  gem 'rubocop', require: false

  # Capistrano is a utility and framework for executing commands in parallel
  # on multiple remote machines, via SSH.
  gem 'capistrano', require: false

  # Bundler support for Capistrano 3.x.
  gem 'capistrano-bundler', require: false

  # Opens SSH shell on remote host in current release directory.
  gem 'capistrano-shell', require: false

  # Handles bootstrapping, running chef solo, rsyncing cookbooks etc.
  gem 'knife-solo', require: false

  # Manages a Cookbook's, or an Application's, Cookbook dependencies.
  gem 'berkshelf', require: false
end
