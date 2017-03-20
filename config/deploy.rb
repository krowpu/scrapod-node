# frozen_string_literal: true

# config valid only for current version of Capistrano
lock '3.8.0'

# Application name
set :application, 'scrapod'

# Application repository
set :repo_url, 'git@github.com:krowpu/scrapod-node.git'

# Default branch is :master
ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
set :deploy_to, "/srv/#{fetch :application}"

# Default value for :format is :airbrussh.
# set :format, :airbrussh

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: 'log/capistrano.log', color: :auto, truncate: :auto

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
# append :linked_files, 'config/database.yml', 'config/secrets.yml'

# Default value for linked_dirs is []
append :linked_dirs, 'log', 'tmp/pids'

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
# set :keep_releases, 5

after :deploy, 'puma:enable'
after :deploy, 'puma:restart'

after :deploy, 'scrapod_server:enable'
after :deploy, 'scrapod_server:restart'
