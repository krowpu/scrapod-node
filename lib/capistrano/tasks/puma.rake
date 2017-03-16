# frozen_string_literal: true

namespace :puma do
  task :enable do
    on roles :all do |_host|
      execute :sudo, 'systemctl enable scrapod-web'
    end
  end

  task :restart do
    on roles :all do |_host|
      execute :sudo, 'systemctl restart scrapod-web'
    end
  end
end
