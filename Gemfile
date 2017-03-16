# frozen_string_literal: true

source 'https://rubygems.org'

git_source :krowpu do |repo_name|
  "https://github.com/krowpu/#{repo_name}.git"
end

# Long-living Capybara Webkit process for web scraping.
gem 'capybara-webkit-daemon', krowpu: 'capybara-webkit-daemon'

group :development do
  # Automatic Ruby code style checking tool.
  # Aims to enforce the community-driven Ruby Style Guide.
  gem 'rubocop', require: false

  # Capistrano is a utility and framework for executing commands in parallel
  # on multiple remote machines, via SSH.
  gem 'capistrano'

  # Bundler support for Capistrano 3.x.
  gem 'capistrano-bundler'

  # Opens SSH shell on remote host in current release directory.
  gem 'capistrano-shell'

  # Handles bootstrapping, running chef solo, rsyncing cookbooks etc.
  gem 'knife-solo'

  # Manages a Cookbook's, or an Application's, Cookbook dependencies.
  gem 'berkshelf'
end
