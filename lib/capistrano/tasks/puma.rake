# frozen_string_literal: true

namespace :puma do
  task :enable do
    on roles :all do |_host|
      execute :sudo, 'systemctl enable scrapod-monitor'
    end
  end

  task :restart do
    on roles :all do |_host|
      execute :sudo, 'systemctl restart scrapod-monitor'
    end
  end
end
