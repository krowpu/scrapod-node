# frozen_string_literal: true

namespace :scrapod_server do
  task :enable do
    on roles :all do |_host|
      execute :sudo, 'systemctl enable scrapod-server'
    end
  end

  task :restart do
    on roles :all do |_host|
      execute :sudo, 'systemctl restart scrapod-server'
    end
  end
end
