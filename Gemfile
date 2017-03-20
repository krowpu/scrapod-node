# frozen_string_literal: true

source 'https://rubygems.org'

git_source :krowpu do |repo_name|
  "https://github.com/krowpu/#{repo_name}.git"
end

# A make-like build utility for Ruby.
gem 'rake', require: false

# A ruby web server built for concurrency.
gem 'puma'

# Long-living Capybara Webkit process for web scraping.
gem 'scrapod-server', krowpu: 'scrapod-server'

# Scrapod monitoring dashboard Rack application.
gem 'scrapod-monitor', krowpu: 'scrapod-monitor'

group :development do
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
